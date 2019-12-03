import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rideal/models/line.dart';
import 'package:rideal/models/stop.dart';
import 'package:rideal/screens/map/widgets/filter.dart';
import 'package:rideal/screens/map/widgets/line_selector.dart';
import 'package:rideal/screens/map/widgets/search_bar.dart';
import 'package:rideal/services/lines.service.dart';


// Reference: https://medium.com/flutter/google-maps-and-flutter-cfb330f9a245
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LineService lineService = LineService();
  
  // Google Map variables
  Completer<GoogleMapController> _controller = Completer();
  final List<Stop> _stops = [];
  Stop selectedStop;
  final location = Location();
  var currentLocation = LatLng(0, 0);
  var loadedMap = false;

  // Filter
  bool showFilter = false;
  bool selectLine = false;
  List<StopType> toShow = [
    StopType.Bus, StopType.Metro, StopType.Train
  ];

  @override
  void initState() {
    lineService.getLinesByCity('Lleida');
    _stops.addAll([
        Stop(
        name: 'Pont de la Universitat',
        position: LatLng(41.609185325821, 0.6244279816746712),
        onTap: _enableLineSelector,
      ),
      Stop(
        name: 'Pont de la Universitat',
        position: LatLng(41.60921465574387, 0.6248443946242332),
        onTap: _enableLineSelector,
      ),
    ]);
    location.getLocation().then((ld) {
      // this.currentLocation = LatLng(ld.latitude, ld.longitude);
      currentLocation = LatLng(41.60921465574387, 0.6248443946242332);
      setState(() {
        loadedMap = true;
      });
    });
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    if (!loadedMap)
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
            trafficEnabled: true,
            markers: _stops // TODO
                      .where((s) => toShow.contains(s))
                      .map((s) => s.marker)
                      .toSet(),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            onTap: (_) {
              this.setState(() {
                this.selectLine = false;
              });
            },
            initialCameraPosition: CameraPosition(
              target: currentLocation, zoom: 18.0
            ),
          ),
          Column(children: <Widget>[
            SearchBar(onFilterPress: () {
              setState(() {
                selectLine = false;
                showFilter = !showFilter;
              });
            }),
            showFilter ? FilterTransport(
              onChange: (toShow) {
               setState(() { this.toShow = toShow; });
              },
            ) : Container(),
          ]),
          LineSelector(
            show: selectLine,
            stop: selectedStop,
          )
        ],
      )
    );
  }

  void _enableLineSelector(Stop s) {
    selectLine = true;
    selectedStop = s;
    setState(() {});
  }
}
