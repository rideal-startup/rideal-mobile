import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rideal/enviroment/enviroment.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/services/sign_in_up.service.dart';

class UserService {
  
  final authService = SignInUpService();

  final _baseUrl = "${Enviroment.apiBaseUrl}${Enviroment.usersUrl}";

  Future<List<User>> getFirstTenRankingUsers() async {
    
    Response response = await Dio()
      .get(
        this._baseUrl,
        queryParameters: { 'pageSize': 10 ,'pageNo': 0 , 'sortBy': 'points' , 'order': 'DESC' }
      );
      
    if (response.statusCode != 200){
      print(response);
    }
    final resBody = response.data;

    return resBody.map<User>((l) { return User.fromJson(l); }).toList();
  }

  Future<List<User>> findFriends() async {
    final currentUser = await this.authService.currentUser;
    print("currentUser: "+currentUser.id);
    final res = await Dio(BaseOptions(headers: {
      'accept': 'application/json'
    })).get('$_baseUrl/${currentUser.id}/friends');
    
    return res.data['_embedded']['users']
      .map<User>((u) => User.fromJson(u))
      .toList();
  }

  Future<List<User>> findRequests() async {
    final currentUser = await this.authService.currentUser;
    final headers = this.authService.getAuthHeaders(currentUser);

    final res = await Dio(BaseOptions(headers: headers))
                      .get('$_baseUrl/followRequests');
    
    return res.data
      .map<User>((u) => User.fromJson(u))
      .toList();
  }

  Future<List<User>> findSentRequests() async {
    final currentUser = await this.authService.currentUser;
    final headers = this.authService.getAuthHeaders(currentUser);

    final res = await Dio(BaseOptions(headers: headers))
                  .get('$_baseUrl/pendingApproval');
  
    return res.data
      .map<User>((u) => User.fromJson(u))
      .toList();
  }

  Future<User> update(User updatedUser) async {
    final user = await this.authService.currentUser;
    final authHeaders = this.authService.getAuthHeaders(user);
    final requests = Dio(BaseOptions(headers: authHeaders));
    final userJson = updatedUser.toJson();
    userJson.remove('friends');
    userJson.remove('requests');
    
    final res = await requests.put(
      _baseUrl + '/' + user.id, 
      data: jsonEncode(userJson));
    
    if (res.statusCode >= 200 && res.statusCode < 300)
      await this.authService.updateUser(updatedUser);
    else
      print(res.data);

    return updatedUser;
  }

  Future<bool> acceptRequest(String userId) async {
    final user = await this.authService.currentUser;
    final authHeaders = this.authService.getAuthHeaders(user);
    final requests = Dio(BaseOptions(headers: authHeaders));

    final res = await requests.post('$_baseUrl/acceptRequest/$userId');

    final acceptOk = res.statusCode >= 200 && res.statusCode < 300;
    if (!acceptOk)
      print(res.data);
    else {
      await this.authService.updateUser(User.fromJson(res.data));
    }

    return acceptOk;
  }

  Future<bool> cancelRequest(String userId) async {
    final user = await this.authService.currentUser;
    final authHeaders = this.authService.getAuthHeaders(user);
    final requests = Dio(BaseOptions(headers: authHeaders));

    final res = await requests.post('$_baseUrl/cancelRequest/$userId');

    final cancelOk = res.statusCode >= 200 && res.statusCode < 300;
    if (!cancelOk)
      print(res.data);
    else {
      await this.authService.updateUser(User.fromJson(res.data));
    }
      
    return cancelOk;
  }

  Future<bool> sendRequest(String userId) async {
    final user = await this.authService.currentUser;
    final authHeaders = this.authService.getAuthHeaders(user);
    final requests = Dio(BaseOptions(headers: authHeaders));

    final res = await requests.post('$_baseUrl/sendRequest/$userId');

    final sendOk = res.statusCode >= 200 && res.statusCode < 300;
    if (!sendOk)
      print(res.data);
      
    return sendOk;
  }

  Future<List<User>> findByUsername(String username) async {
    final user = await this.authService.currentUser;
    final authHeaders = this.authService.getAuthHeaders(user);
    final requests = Dio(BaseOptions(headers: authHeaders));

    final res = await requests.get(
      '$_baseUrl/findByUsernameLike',
      queryParameters: { 'username': username });
    
    return res.data
      .map<User>((u) => User.fromJson(u))
      .toList();
  }


  void saveUser(User currentUser) async{
      if(currentUser != null){
        print("CurrentUser is null when we try to save!");
        return;
      }
      Response response = await Dio()
      .patch(
        this._baseUrl+"/"+currentUser.id,
         data: {"id": currentUser.id,
               "city": currentUser.city,
               "email": currentUser.email,
          }
      );
      
    if(response.statusCode != 200){
      print(response);
    }
  }


}


//return this.http.get(`${environment.API_BASE_URL}/users?pageSize=10&pageNo=0&sortBy=points&order=DESC`);
