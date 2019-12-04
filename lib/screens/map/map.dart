import 'dart:async';
import 'dart:collection';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rideal/models/city.dart';
import 'package:rideal/models/line.dart';
import 'package:rideal/models/stop.dart';
import 'package:rideal/screens/map/widgets/filter.dart';
import 'package:rideal/screens/map/widgets/line_selector.dart';
import 'package:rideal/screens/map/widgets/search_bar.dart';
import 'package:rideal/services/lines.service.dart';
import 'package:rideal/services/cities.service.dart';

// Reference: https://medium.com/flutter/google-maps-and-flutter-cfb330f9a245
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LineService lineService = LineService();
  final CitiesService citiesService = CitiesService();

  // Google Map variables
  Completer<GoogleMapController> _controller = Completer();
  final HashMap<String, Stop> _stops = HashMap();
  Stop selectedStop;
  final location = Location();
  City currentCity = City();
  var currentLocation = LatLng(0, 0);
  var loadedMap = false;

  // Filter
  bool showFilter = false;
  bool selectLine = false;
  List<StopType> toShow = [StopType.Bus, StopType.Metro, StopType.Train];

  Future _fetchData() async {
    this.currentCity = await _findCurrentCity();
    final lines = await this.lineService.getLinesByCity(this.currentCity.id);

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
          markers: _stops.values // TODO
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
        Column(children: <Widget>[
          SearchBar(onFilterPress: () {
            setState(() {
              selectLine = false;
              showFilter = !showFilter;
            });
          }),
          showFilter
              ? FilterTransport(
                  onChange: (toShow) {
                    setState(() {
                      this.toShow = toShow;
                    });
                  },
                )
              : Container(),
        ]),
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
  }

  void fillStopHash() {}

  Future<City> _findCurrentCity() async {
    final ld = await location.getLocation();
    List<City> listCities = await citiesService.getAllCities();
    double distance = 9999.9;
    City closeCity;

    listCities.forEach((city) {
      final cityDistance = sqrt(pow(city.location.latitude - ld.latitude, 2) +
          pow(city.location.longitude - ld.longitude, 2));

      if (cityDistance < distance) {
        distance = cityDistance;
        closeCity = city;
      }
    });

    return closeCity;
  }

  Marker _markerFromStop(Stop stop) {
    return Marker(
      position: stop.position,
      markerId: MarkerId(stop.position.toString()),
      infoWindow: InfoWindow(
        title: stop.name,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      onTap: () async { 
        this.selectedStop = stop;
        this.selectLine = true;
        setState(() {
          
        });
      },
    );
  }
}
