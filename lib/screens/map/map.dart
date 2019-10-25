import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rideal/screens/map/widgets/filter.dart';
import 'package:rideal/screens/map/widgets/line_selector.dart';
import 'package:rideal/screens/map/widgets/search_bar.dart';
import 'package:rideal/screens/map/widgets/stop.dart';

// Reference: https://medium.com/flutter/google-maps-and-flutter-cfb330f9a245
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Google Map variables
  Completer<GoogleMapController> _controller = Completer();
  final List<Stop> _stops = [];
  final location = Location();
  var currentLocation = LatLng(0, 0);
  var loadedMap = false;

  // Filter
  bool showFilter = false;
  bool selectLine = false;

  @override
  void initState() {
    location.getLocation().then((ld) {
      this.currentLocation = LatLng(ld.latitude, ld.longitude);
      this.setState(() {
        this.loadedMap = true;
      });
    });
    super.initState();
  }

  void _onCameraMove(CameraPosition position) {}

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    if (!this.loadedMap)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[200]),
        ),
      );

    return Container(
        child: Stack(
      children: <Widget>[
        GoogleMap(
          compassEnabled: false,
          mapToolbarEnabled: false,
          onMapCreated: _onMapCreated,
          onCameraMove: _onCameraMove,
          trafficEnabled: true,
          markers: _stops.map((s) => s.marker).toSet(),
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          
          onTap: (_) {
            this.setState(() {
              this.selectLine = false;
            });
          },
          onLongPress: _onAddMarkerButtonPressed,
          initialCameraPosition: CameraPosition(
              target: currentLocation, zoom: 18.0, bearing: 40.0),
        ),
        Column(children: <Widget>[
          SearchBar(onFilterPress: () {
            this.setState(() {
              showFilter = !showFilter;
            });
          }),
          showFilter ? FilterTransport() : Container(),
        ]),
        LineSelector(
          show: selectLine,
          lines: [
            Line(
              color: Colors.yellow,
            ),
            Line(
              color: Colors.red,
            ),
            Line(
              color: Colors.blueAccent,
            ),
          ],
        )
      ],
    ));
  }

  void _onAddMarkerButtonPressed(LatLng pos) {
    setState(() {
      _stops.add(Stop(
          marker: Marker(
              // This marker id can be anything that uniquely identifies each marker.
              markerId: MarkerId(pos.toString()),
              position: pos,
              infoWindow: InfoWindow(
                title: 'Really cool place',
                snippet: '5 Star Rating',
              ),
              icon: BitmapDescriptor.defaultMarker,
              onTap: () {
                this.setState(() {
                  this.selectLine = !this.selectLine;
                });
              })));
    });
  }
}
