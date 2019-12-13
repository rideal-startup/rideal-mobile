import 'package:dio/dio.dart';
import 'package:rideal/enviroment/enviroment.dart';
import 'package:rideal/models/user.dart';
import 'dart:convert';

import 'package:rideal/services/signed_user.service.dart';

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

      print("STATUS CODE");
      print(response.statusCode);
      if(response.statusCode >= 200 && response.statusCode < 300){
        print("HELLOOOO");
        print(response.data);
        SignedUser.setSignedUser(User.fromJson(response.data));
        print("HELLOOOO");
        return true;
      } else {
        return false;
      }
    } catch(e) {
      print(e.toString());
      return false;
    }
  }

}