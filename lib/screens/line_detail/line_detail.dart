import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rideal/models/line.dart';
import 'package:rideal/models/location_message.dart';
import 'package:rideal/models/stop.dart';
import 'package:rideal/screens/home/home.dart';
import 'package:rideal/screens/line_detail/widgets/line_header.dart';
import 'package:rideal/screens/line_detail/widgets/suggestion.dart';
import 'package:rideal/services/i18n.dart';
import 'package:rideal/services/lines.service.dart';
import 'package:rideal/services/rabbit_mq.service.dart';
import 'package:rideal/widgets/navBar/curved_navigation_bar.dart';

class LineDetailScreen extends StatefulWidget {
  final Line line;

  const LineDetailScreen({Key key, this.line}) : super(key: key);

  @override
  _LineDetailScreenState createState() => _LineDetailScreenState();
}

class _LineDetailScreenState extends State<LineDetailScreen> {
  // Services
  final lineService = LineService();
  final rabbitService = RabbitService();
  final locationService = Location();

  bool readyMap = false;
  bool selected = false;

  Completer<GoogleMapController> _controller = Completer();
  LatLng _center;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  List<Stop> lineStops = [];

  @override
  void initState() {
    _center = this.widget.line.location;
    _createPolylines();
    
    Timer.periodic(Duration(seconds: 1), (_) async {
      final pos = await locationService.getLocation();
      rabbitService.publish(
        LocationMessage(
          lineId: this.widget.line.id,
          lat: pos.latitude,
          lng: pos.longitude,
        )
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);

    setState(() {
      for (var stop in lineStops) {
        _markers.add( Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId(stop.name.toString()),
          position: stop.position,
          infoWindow: InfoWindow(
            title: stop.name,
            //si no tire borra la linia de devall
            snippet: stop.order.toString(),

          ),
        icon: BitmapDescriptor.defaultMarker,
        ));
        _createPolylines(); 
      }
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
            //rotateGesturesEnabled: false,
            //scrollGesturesEnabled: false,
            //zoomGesturesEnabled: false,
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
          ),
          LineHeader(line: this.widget.line),
          //Suggestion(),
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
                _createPolylines();
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                _imInButton(),
                _ridealingButton()
              ],
            ),
          ),
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
                  switch(index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage(index: 0,)),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage(index: 1,)),
                      );
                    break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage(index: 2,)),
                      );
                    break;
                    default:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage(index: 1,)),
                      );
                    }
                  },
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(bottom:11.0),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  width: 50,
                  height: 50,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    onPressed: () => {Navigator.pop(context)}
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget _imInButton() {
    return AnimatedContainer(
      height: selected ? 000.0 : 125.0,
      color: selected ? Colors.green : Colors.blue,
      alignment: 
        selected ? Alignment.center : AlignmentDirectional.topCenter,
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: Padding(
          padding: const EdgeInsets.only(top: 22.5),
          child: Text(
            I18n.of(context).translate('i-am-in'),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
    );
  }

  Widget _ridealingButton() {
    return AnimatedContainer(
      height: selected ? 125.0 : 0.0,
      color: selected ? Colors.green : Colors.blue,
      alignment:
      selected ? Alignment.topCenter : AlignmentDirectional.topCenter,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
      child: Padding(
        padding: const EdgeInsets.only(top: 22.5),
        child: Text(
          "Ridealing!",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
