import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:rideal/enviroment/enviroment.dart';
import 'package:rideal/models/city.dart';

class CitiesService {
  
   Future<List<City>> getAllCities() async {
    try {
      Response response = await Dio()
      .get(Enviroment.apiBaseUrl + Enviroment.citiesUrl);
      if(response.statusCode != 200){
        print(response);
      }

      final responseBody = jsonDecode(response.data);

      return responseBody['_embedded']['cities'].map<City>((l) { return City.fromJson(l); }).toList();
    } catch (e) {
      print(e);
      return null;
    }

    
  }
  
}