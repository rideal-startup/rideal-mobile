import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rideal/screens/map/widgets/search_bar.dart';

// Reference: https://medium.com/flutter/google-maps-and-flutter-cfb330f9a245
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition;
  @override
  void initState() {
    _lastMapPosition = _center;
    super.initState();
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
      children: <Widget>[  
        GoogleMap(
          onMapCreated: _onMapCreated,
          onCameraMove: _onCameraMove,
          markers: _markers,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
        SearchBar(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: _onAddMarkerButtonPressed,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              backgroundColor: Colors.green,
              child: const Icon(Icons.map, size: 36.0),
            ),
          ),
        ),
      ],
    ));
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
}
