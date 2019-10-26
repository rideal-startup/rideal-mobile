import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rideal/screens/line_detail/widgets/line_header.dart';
import 'package:rideal/services/i18n.dart';

class LineDetailScreen extends StatefulWidget {
  @override
  _LineDetailScreenState createState() => _LineDetailScreenState();
}

class _LineDetailScreenState extends State<LineDetailScreen> {
  bool selected = false;

  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  LatLng _lastMapPosition;

  List<LatLng> latlng = [
    LatLng(45.521563, -122.677433),
    LatLng(45.521563, -122.607433),
    LatLng(45.510563, -122.609433),
    LatLng(45.500563, -122.624533),
    LatLng(45.500563, -122.677433),
    LatLng(45.470563, -122.700000),
    LatLng(45.470563, -122.750000),
    LatLng(45.570000, -122.750000),
    LatLng(45.521563, -122.677433),
  ];

  @override
  void initState() {
    _lastMapPosition = _center;
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
      for (var marker in latlng) {
        _markers.add( Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId(marker.toString()),
          position: marker,
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
    _polylines.clear();
    _polylines.add(Polyline(
        jointType: JointType.round,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        polylineId: PolylineId(_lastMapPosition.toString()),
        visible: true,
        points: latlng,
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
            rotateGesturesEnabled: false,
            scrollGesturesEnabled: false,
            zoomGesturesEnabled: false,
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          LineHeader(),
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
        ],
      )
    );
  }

  Widget _imInButton() {
    return AnimatedContainer(
      height: selected ? 000.0 : 75.0,
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
      height: selected ? 75.0 : 0.0,
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
