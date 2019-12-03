import 'dart:core';

import 'package:dio/dio.dart';
import 'package:rideal/enviroment/enviroment.dart';

class CitiesService {
  
   Future<List<String>> getAllCities() async {
    try {
      Response response = await Dio()
      .get(Enviroment.apiBaseUrl + Enviroment.citiesUrl);
      if(response.statusCode == 200){
        print(response);
      }else{
        print(response);
      }
      return response as List<String>;
    } catch (e) {
      print(e);
      return null;
    }

    
  }
  
}