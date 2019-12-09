import 'dart:convert';
import 'dart:core';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rideal/enviroment/enviroment.dart';
import 'package:rideal/models/city.dart';

class CitiesService {
  final location = Location();

  Future<List<City>> getAllCities() async {
    try {
      Response response =
          await Dio().get(Enviroment.apiBaseUrl + Enviroment.citiesUrl);

      if (response.statusCode != 200) {
        print(response);
      }

      final responseBody = jsonDecode(response.data)['_embedded']['cities'];
      return responseBody
              .map<City>((l) => City.fromJson(l))
              .toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  double _euclideanDistance(final LatLng point1, 
                            final LatLng point2) {

    final lat = pow(point2.latitude - point1.latitude, 2);
    final lon = pow(point2.longitude - point1.longitude, 2);
    return sqrt(lat + lon);
  }

  Future<City> findCurrentCity() async {
    final location = await this.location.getLocation();
    final latLngLocation = LatLng(location.latitude, 
                                  location.longitude);
    final cities = await this.getAllCities();

    double distance = 9999.9;
    City closeCity;

    cities.forEach((city) {
      final dist = _euclideanDistance(city.location, latLngLocation);
      if (dist < distance) {
        distance = dist;
        closeCity = city;
      }
    });

    return closeCity;
  }
}
