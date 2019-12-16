import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rideal/enviroment/enviroment.dart';
import 'package:rideal/models/line.dart';
import 'package:rideal/models/stop.dart';

class LineService {
  
  final _baseUrl = "${Enviroment.apiBaseUrl}${Enviroment.linesUrl}";

  // Future<Line> findById(String lineId) {

  // }

  Future<List<Line>> linesContaining(Stop stop) async {
    Response response = await Dio()
      .get(
        this._baseUrl + '/containStop',
        queryParameters: { 'stopName': '${stop.name}' }
      );
      
    if(response.statusCode != 200){
      print(response);
    }

    final resBody = response.data;
    return resBody
             .map<Line>((l) => Line.fromJson(l))
          .  toList();
  }

  Future<List<Line>> getLinesByCity(String cityId) async {
    try {
      Response response = await Dio()
      .get(
        this._baseUrl + '/search/findByCity',
        queryParameters: { 'city': '/cities/$cityId' }
      );
      
      if(response.statusCode != 200){
        print(response);
      }
      
      final resBody = jsonDecode(response.data);
      return resBody['_embedded']['lines']
              .map<Line>((l) => Line.fromJson(l))
              .toList();

    } catch (e) {
      print(e);
      return null;
    }
  }
}