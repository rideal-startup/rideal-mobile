import 'package:dio/dio.dart';
import 'package:localstorage/localstorage.dart';
import 'package:rideal/enviroment/enviroment.dart';
import 'package:rideal/models/user.dart';
import 'dart:convert';

class SignInUpService {

  final _userStorage = LocalStorage('authStorage');

  Map<String, dynamic> getAuthHeaders(final User user) {
    final username = user.username;
    final password = user.password; 
    print(username + ':' + password);
    final auth = 'Basic ' + base64.encode(latin1.encode('$username:$password'));
    return {
      'Authorization' : auth.trim(),
      'accept': 'application/json'
    };
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
      response.data['password'] = user.password;

      if (loginOk)
        this._userStorage.setItem('user', response.data);

      return loginOk;
      
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> logout() async {
    await this._userStorage.ready;
    this._userStorage.deleteItem('user');
    return;
  }

  Future<User> get currentUser async {
    await this._userStorage.ready;
    final userMap = this._userStorage.getItem('user');
    if (userMap == null)
      return null;
    return User.fromJson(userMap);
  }

  Future<bool> get isLoggedIn async {
    await this._userStorage.ready;
    return this._userStorage.getItem('user') != null;
  }

  Future<void> updateUser(User newUser) async {
    final previousUser = await this.currentUser;
    newUser.password = previousUser.password;
    this._userStorage.setItem('user', newUser.toJson(cityToUri: false));
  }
}