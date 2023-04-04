import 'package:connection/src/http/data/data.dart';
import 'dart:typed_data';

abstract class HttpClient {
  Future<HttpResponse> request({
    required String url,
    required String method,
    Map<String, dynamic>? queryParameters,
    Map? body,
    Map<String, dynamic>? headers,
  });
  Future<Uint8List> download({
    required String url,
  });
}
