import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rideal/enviroment/enviroment.dart';
import 'package:rideal/models/stop.dart';

class StopService {
  final dio = Dio(BaseOptions(
    contentType: 'application/json',
  ));

  final baseUrl = '${Enviroment.apiBaseUrl}/stops';

  Future<List<Stop>> findStopsByNameLike(String name) async {
    final response = await this.dio.get(
      this.baseUrl + '/findStopsByNameLike',
      queryParameters: {'name': name
    });

    return response
            .data
            .map<Stop>((s) => Stop.fromJson(s))
            .toList();
  }
}