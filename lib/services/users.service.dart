import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rideal/enviroment/enviroment.dart';
import 'package:rideal/models/line.dart';
import 'package:rideal/models/stop.dart';
import 'package:rideal/models/user.dart';

class UserService {
  
  
  final _baseUrl = "${Enviroment.apiBaseUrl}${Enviroment.usersUrl}";

  // Future<Line> findById(String lineId) {

  // }

  Future<List<User>> getFirstTenRankingUsers() async {
    
    Response response = await Dio()
      .get(
        this._baseUrl,
        queryParameters: { 'pageSize': 10 ,'pageNo': 0 , 'sortBy': 'points' , 'order': 'DESC' }
      );
      
    if(response.statusCode != 200){
      print(response);
    }
    print(response.data.runtimeType);
    final resBody = response.data;

    return resBody.map<User>((l) { return User.fromJson(l); }).toList();
    
  }
}


//return this.http.get(`${environment.API_BASE_URL}/users?pageSize=10&pageNo=0&sortBy=points&order=DESC`);
