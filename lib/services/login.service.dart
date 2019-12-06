import 'package:dio/dio.dart';
import 'package:rideal/enviroment/enviroment.dart';
import 'package:rideal/models/user.dart';
import 'dart:convert';

class LoginService {
  Future<bool> login(User user) async {
    print("login");
    try {
      print("Try");
      String userJson = jsonEncode(user.toJson());
      print("userJson");
      print(userJson);
      Response response = await Dio().post(Enviroment.apiBaseUrl + Enviroment.usersUrl, data: userJson);
      return (response.statusCode >= 200 && response.statusCode < 300);
    } catch(e) {
      print("Start Catch:");
      print(e.toString());
      print("End Catch:");
      return false;
    }
  }
}