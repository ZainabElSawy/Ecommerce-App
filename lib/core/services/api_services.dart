import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService {
  ApiService(this.dio);
  final Dio dio;

  // Future<dynamic> get({required String endPoint}) async {
  //   var headers = {'Accept': 'application/json'};
  //   Response response = await dio.request(
  //     endPoint,
  //     options: Options(
  //       method: 'GET',
  //       headers: headers,
  //     ),
  //   );

  //   if (response.statusCode == 200) {
  //     log(json.encode(response.data));
  //   }
  //   return response.data;
  // }
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    try {
      Response response = await dio.get(endPoint);
      return json.decode(response.data);
    } catch (e) {
      rethrow;
    }
  }

  post({required String endPoint, required var data}) async {
    try {
      FormData formData = FormData.fromMap(data);
      Response response = await dio.post(endPoint, data: formData);
      return json.decode(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
