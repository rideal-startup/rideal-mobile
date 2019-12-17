import 'package:dio/dio.dart';
import 'package:rideal/enviroment/enviroment.dart';
import 'package:rideal/models/feed.dart';
import 'package:rideal/services/sign_in_up.service.dart';

class FeedService {
  final authService = SignInUpService();

  Future<List<Feed>> getUserFeed(String userId) async {
    Response response = await Dio()
      .get("${Enviroment.apiBaseUrl}${Enviroment.feedUrl}" + userId);
      
    if(response.statusCode != 200){
      print(response);
    }
    final resBody = response.data;
    return resBody
             .map<Feed>((l) => Feed.fromJson(l))
          .toList();
  }
}