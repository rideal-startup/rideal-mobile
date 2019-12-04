import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rideal/enviroment/enviroment.dart';
import 'package:rideal/models/line.dart';

class LineService {
  
  final _baseUrl = "${Enviroment.apiBaseUrl}${Enviroment.linesUrl}";

  Future<Line> findById(String lineId) {
    
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
      return resBody['_embedded']['lines'].map<Line>((l) { return Line.fromJson(l); }).toList();

    } catch (e) {
      print(e);
      return null;
    }
  }
  
}