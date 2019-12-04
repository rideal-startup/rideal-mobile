import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rideal/models/city.dart';
import 'package:rideal/models/stop.dart';
import 'package:rideal/screens/map/widgets/autocomplete.dart';
import 'package:rideal/screens/map/widgets/filter.dart';
import 'package:rideal/screens/map/widgets/line_selector.dart';
import 'package:rideal/screens/map/widgets/search_bar.dart';
import 'package:rideal/services/lines.service.dart';
import 'package:rideal/services/cities.service.dart';
import 'package:rideal/services/stop.service.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Services
  final lineService = LineService();
  final citiesService = CitiesService();
  final stopService = StopService();
  final location = Location();

  // Google Map variables
  Completer<GoogleMapController> _controller = Completer();
  final HashMap<String, Stop> _stops = HashMap();
  var currentLocation = LatLng(0, 0);
  var loadedMap = false;

  // Line selector
  Stop selectedStop;
  bool selectLine = false;

  // Filter
  bool showFilter = false;
  List<StopType> toShow = [StopType.Bus, StopType.Metro, StopType.Train];

  // Stops autocomplete
  final textController = TextEditingController();
  Timer _queryTimeout;
  List<Stop> _autoCompleteStops = [];

  Future _fetchData() async {
    final currentCity = await citiesService.findCurrentCity();
    final lines = await this.lineService.getLinesByCity(currentCity.id);

    lines.forEach((line) {
      line.stops.forEach((stop) {
        this._stops[stop.name] = stop;
      });
    });
  }

  @override
  void initState() {
    location.getLocation().then((ld) {
      this.currentLocation = LatLng(ld.latitude, ld.longitude);
      setState(() {
        loadedMap = true;
      });
    });
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    _fetchData().then((_) {
      setState(() {});
    });
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
          markers: _stops.values // TODO: filter stops
              .map(_markerFromStop)
              .toSet(),
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          onTap: (_) {
            this.setState(() {
              this.selectLine = false;
            });
          },
          initialCameraPosition:
              CameraPosition(target: currentLocation, zoom: 18.0),
        ),
        _createSearchBar(),
        LineSelector(
          show: selectLine,
          stop: selectedStop,
        )
      ],
    ));
  }

  void _enableLineSelector(Stop s) {
    selectLine = true;
    selectedStop = s;
    setState(() { });
  }

  Marker _markerFromStop(Stop stop) {
    return Marker(
      position: stop.position,
      markerId: MarkerId(stop.position.toString()),
      infoWindow: InfoWindow(
        title: stop.name,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      onTap: () { 
        _enableLineSelector(stop);
      },
    );
  }

  Widget _createSearchBar() {
    return Column(
      children: <Widget>[
        SearchBar(
          controller: textController,
          onFilterPress: () {
            setState(() {
              selectLine = false;
              showFilter = !showFilter;
            });
          },
          onTextUpdate: _lookForStops,
        ),
        showFilter ? FilterTransport(
            onChange: (toShow) {
              setState(() {
                this.toShow = toShow;
              });
            },
          )
        : Container(),
        StopAutoComplete(
          stops: _autoCompleteStops,
          onSelected: (Stop stop) async {
            _autoCompleteStops = [];
            currentLocation = stop.position;
            textController.text = stop.name;
            _controller.future.then((mapController) {
              mapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: stop.position, zoom: 20.0),
                  ),
                );
              }
            );
            setState(() {});
          },
        )
      ]
    );
  }

  void _lookForStops(String text) {
    _queryTimeout?.cancel();
    if (text == '') {
      _autoCompleteStops = [];
      return;
    }

    final duration = Duration(milliseconds: 500);
    
    _queryTimeout = Timer(duration, () async {
      _autoCompleteStops = await stopService.findStopsByNameLike(text);
      setState(() {});
    });
  }
}
