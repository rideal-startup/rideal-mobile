import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rideal/models/line.dart';
import 'package:rideal/models/location_message.dart';
import 'package:rideal/models/stop.dart';
import 'package:rideal/screens/home/home.dart';
import 'package:rideal/screens/line_detail/widgets/bottom_button.dart';
import 'package:rideal/screens/line_detail/widgets/line_header.dart';
import 'package:rideal/services/lines.service.dart';
import 'package:rideal/services/location_ws.service.dart';
import 'package:rideal/services/rabbit_mq.service.dart';
import 'package:rideal/widgets/navBar/curved_navigation_bar.dart';

import '../../utils.dart';

class LineDetailScreen extends StatefulWidget {
  final Line line;

  const LineDetailScreen({Key key, this.line}) : super(key: key);

  @override
  _LineDetailScreenState createState() => _LineDetailScreenState();
}

class _LineDetailScreenState extends State<LineDetailScreen> {
  // Services
  final lineService = LineService();
  final rabbitService = RabbitService.instance;
  final locationService = Location();
  final wsLocationService = RealTimeLocation();

  bool selected = false;

  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  BitmapDescriptor _bitmap;

  List<Stop> lineStops = [];
  LocationMessage lm;
  StreamSubscription _subs;
  @override
  void initState() {
    _subs = wsLocationService.subscribeToLine(
      lineId: this.widget.line.id,
      onMessage: (msg) async {
        if (lm != null && msg.timestamp != lm.timestamp) {
          _markers.add(Marker(
            position: msg.location,
            markerId: MarkerId('current-loc'),
            icon: _bitmap,
            infoWindow: InfoWindow(title: 'Line location')
          ));
          setState(() {});
        }
        lm = msg;
      }
    );

    _createPolylines();
    super.initState();
  }

  @override
  void dispose() {
    this._subs.cancel();
    this.rabbitService.stopTransmission();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);

    getBytesFromAsset('assets/images/light_marker.png', 80).then((bytes) {
      _bitmap = BitmapDescriptor.fromBytes(bytes);
      setState(() {
        for (var stop in lineStops) {
          _markers.add(Marker(
            markerId: MarkerId(stop.name.toString()),
            position: stop.position,
            infoWindow: InfoWindow(
              title: stop.name,
              snippet: stop.order.toString(),
            ),
          icon: _bitmap,
          ));
          _createPolylines(); 
        }
      });
    });
  }

  void _createPolylines() {
    lineStops = this.widget.line.stops;
    _polylines.clear();
    _polylines.add(Polyline(
        jointType: JointType.round,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        polylineId: PolylineId('routes'),
        visible: true,
        points: lineStops.map((s) => s.position).toList(),
        color: !selected ? Colors.blue : Colors.green,
        width: 5,
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildLineDetail(context));
  }

  Widget buildLineDetail(BuildContext context) {
    return Container(
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          GoogleMap(
            polylines: _polylines,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: this.widget.line.location,
              zoom: 14.0,
            ),
          ),
          LineHeader(line: this.widget.line),
          // Suggestion(),
          RidealingButton(onTap: this._triggerSelect),
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: CurvedNavigationBar(
                color: Colors.grey[900],
                index: 1,
                backgroundColor: Colors.transparent,
                items: <Widget>[
                  Icon(Icons.supervised_user_circle,size: 30,color: Colors.pink[200]),
                  Icon(Icons.pin_drop, size: 30, color: Colors.pink[200]),
                  Icon(Icons.monetization_on, size: 30, color: Colors.pink[200]),
                  Icon(Icons.monetization_on, size: 30, color: Colors.red[200]),
                ],
                onTap: (index) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(index: 0,)),
                  );
                }
              ),
            ),
          ),
        ],
      )
    );
  }

  void _triggerSelect() {
    this.selected = !this.selected;
    _createPolylines();

    if (selected)
      rabbitService.sendLocationEvery(
        duration: Duration(seconds: 1), 
        lineId: this.widget.line.id
      );
    else 
      rabbitService.stopTransmission();
  }
}
