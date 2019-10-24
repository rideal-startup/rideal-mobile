import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rideal/screens/map/widgets/filter.dart';
import 'package:rideal/screens/map/widgets/search_bar.dart';

// Reference: https://medium.com/flutter/google-maps-and-flutter-cfb330f9a245
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  
  // Google Map variables
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition;
  final location = Location();
  var currentLocation = LatLng(0, 0);
  var loadedMap = false;

  // Filter
  bool showFilter = false;

  @override
  void initState() {
    location.getLocation().then((ld) {
      this.currentLocation = LatLng(ld.latitude, ld.longitude);
      this.setState(() {this.loadedMap = true;});
    });
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
    if (!this.loadedMap)
      return Center(child: CircularProgressIndicator(),);

    return Container(
      child: Stack(
      children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          onCameraMove: _onCameraMove,
          markers: _markers,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
            target: currentLocation,
            zoom: 16.0,
          ),
        ),
        Column(children: <Widget>[
          SearchBar(onFilterPress: () {
            this.setState(() { showFilter = !showFilter; });
          }),
          showFilter ? FilterTransport() : Container(),
        ]),
        // Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: Align(
        //     alignment: Alignment.bottomRight,
        //     child: FloatingActionButton(
        //       onPressed: _onAddMarkerButtonPressed,
        //       materialTapTargetSize: MaterialTapTargetSize.padded,
        //       backgroundColor: Colors.green,
        //       child: const Icon(Icons.map, size: 36.0),
        //     ),
        //   ),
        // ),
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
