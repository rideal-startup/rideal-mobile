import 'package:dio/dio.dart';
import 'package:rideal/enviroment/enviroment.dart';

class LineService {
  
  void getLinesByCity(String cityId) async {
    try {
      Response response = await Dio()
      .get(Enviroment.apiBaseUrl + Enviroment.linesUrl +
      "/search/findByCity?city=/cities/" + '5dd043e25043225f571cc6ef');
      
      print(response);
    } catch (e) {
      print(e);
    }
  }
  
}