import 'package:dio/dio.dart';

class DioHeadersHandler {
  static Map<String, dynamic>? handle(Response response) {
    final headers = response.headers.map;
    return headers.map<String, String>((key, value) => MapEntry(key, value[0]));
  }
}
