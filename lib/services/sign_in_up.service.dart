import 'package:dio/dio.dart';
import 'package:rideal/enviroment/enviroment.dart';
import 'package:rideal/models/user.dart';
import 'dart:convert';

class SignInUpService {
  Future<bool> signUp(User user) async {
    try {
      String userJson = jsonEncode(user.toJson());
      Response response = await Dio().post(Enviroment.apiBaseUrl + Enviroment.usersUrl, data: userJson);
      return (response.statusCode >= 200 && response.statusCode < 300);
    } catch(e) {
      return false;
    }
  }

  Future<bool> login(User user) async {
    try {
      final username = user.username;
      final password = user.password; 
      final auth = 'Basic ' + base64.encode(latin1.encode('$username:$password'));
      final response = await Dio(BaseOptions(
          headers: { 'Authorization': auth.trim() })).get(Enviroment.apiBaseUrl + '/identity', 
      );
      return (response.statusCode >= 200 && response.statusCode < 300);
    } catch(e) {
      return false;
    }
  }
}