import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  ApiService({required this.dio, this.baseUrl});
  final String? baseUrl;
  final Dio dio;
  Future<Map<String, dynamic>> get({required String? endPoint}) async {
    try {
      Response response = await dio.get("$baseUrl$endPoint");
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  post({required String? endPoint, required var data}) async {
    try {
      FormData formData = FormData.fromMap(data);
      Response response = await dio.post(endPoint!, data: formData);
      return json.decode(response.data);
    } catch (e) {
      rethrow;
    }
  }
}