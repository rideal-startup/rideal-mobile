import 'package:dio/dio.dart';
import 'package:localstorage/localstorage.dart';
import 'package:rideal/enviroment/enviroment.dart';
import 'package:rideal/models/user.dart';
import 'dart:convert';

import 'package:rideal/services/signed_user.service.dart';

class SignInUpService {

  User _currentUser;
  final _userStorage = LocalStorage('authStorage');

  Map<String, dynamic> getAuthHeaders(final User user, 
                                      {Map<String, dynamic> existingHeaders = const {}}) {
    final username = user.username;
    final password = user.password; 
    final auth = 'Basic ' + base64.encode(latin1.encode('$username:$password'));
    existingHeaders['Authorization'] = auth.trim();
    return existingHeaders;
  }

  Future<bool> signUp(User user) async {
    try {
      String userJson = jsonEncode(user.toJson());
      Response response = await Dio()
        .post(Enviroment.apiBaseUrl + Enviroment.usersUrl, data: userJson);
      return (response.statusCode >= 200 && response.statusCode < 300);
    } catch(e) {
      return false;
    }
  }

  Future<bool> login(User user) async {
    try {
      final request = Dio(
        BaseOptions(headers: getAuthHeaders(user)));
      
      final response = await request.get(Enviroment.apiBaseUrl + '/identity');
      final loginOk = response.statusCode >= 200 && response.statusCode < 300;

      if (loginOk)
        this._userStorage.setItem('user', response.data);

      return loginOk;
      
    } catch (e) {
      print(e);
      return false;
    }
  }

  void logout() {
    this._userStorage.deleteItem('user');
  }

  User get currentUser {
    final userMap = this._userStorage.getItem('user');
    return User.fromJson(userMap);
  }

  bool get isLoggedIn {
    return this._userStorage.getItem('user') != null;
  }
}