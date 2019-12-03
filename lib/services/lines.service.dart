import 'package:dio/dio.dart';
import 'package:rideal/enviroment/enviroment.dart';

class LineService {
  
  final _baseUrl = "${Enviroment.apiBaseUrl}${Enviroment.linesUrl}";
  void getLinesByCity(String cityId) async {
    try {
      Response response = await Dio()
      .get(
        this._baseUrl + '/search/findByCity',
        queryParameters: { 'city': '/cities/$cityId'}
      );
      print(response);
    } catch (e) {
      print(e);
    }
  }
  
}