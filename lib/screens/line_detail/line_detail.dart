import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rideal/models/line.dart';
import 'package:rideal/models/stop.dart';
import 'package:rideal/screens/home/home.dart';
import 'package:rideal/screens/line_detail/widgets/line_header.dart';
import 'package:rideal/screens/line_detail/widgets/suggestion.dart';
import 'package:rideal/services/i18n.dart';
import 'package:rideal/services/lines.service.dart';
import 'package:rideal/widgets/navBar/curved_navigation_bar.dart';

class LineDetailScreen extends StatefulWidget {
  final Line line;

  const LineDetailScreen({Key key, this.line}) : super(key: key);

  @override
  _LineDetailScreenState createState() => _LineDetailScreenState();
}

class _LineDetailScreenState extends State<LineDetailScreen> {
  LineService lineService = LineService();
  bool selected = false;

  Completer<GoogleMapController> _controller = Completer();
  LatLng _center;// = const LatLng(45.521563, -122.677433);
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  LatLng _lastMapPosition;

  List<Stop> lineStops = [];/*[
    LatLng(45.521563, -122.677433),
    LatLng(45.521563, -122.607433),
    LatLng(45.510563, -122.609433),
    LatLng(45.500563, -122.624533),
    LatLng(45.500563, -122.677433),
    LatLng(45.470563, -122.700000),
    LatLng(45.470563, -122.750000),
    LatLng(45.570000, -122.750000),
    LatLng(45.521563, -122.677433),
  ];*/

  @override
  void initState() {
    double focusResultLong = 0.0;
    double focusResultLat = 0.0;
    int numStops = 0;
    this.widget.line.stops.forEach((stop){
      focusResultLat += stop.position.latitude;
      focusResultLong += stop.position.longitude;
      numStops +=1;
    });
    if(numStops!=0){
      _center = new LatLng(focusResultLat/numStops, focusResultLong/numStops);
    }
    
    _lastMapPosition = _center;
    _createPolylines();
    
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
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
            title: 'Custom Marker',
            snippet: 'Inducesmile.com',
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
        polylineId: PolylineId(_lastMapPosition.toString()),
        visible: true,
        points: lineStops.map((s)=>s.position).toList(),
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
            onCameraMove: _onCameraMove,
            //rotateGesturesEnabled: false,
            //scrollGesturesEnabled: false,
            //zoomGesturesEnabled: false,
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
          ),
          LineHeader(),
          Suggestion(),
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
