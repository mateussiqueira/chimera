import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../../connection.dart';

class DioLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    ConnectionLog.logRequest(
      uri: options.uri,
      method: options.method,
      headers: options.headers.toString(),
      body: options.data?.toString(),
    );
    return handler.next(options);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    ConnectionLog.logResponse(
      url: response.requestOptions.uri.toString(),
      method: response.requestOptions.method,
      statusCode: response.statusCode,
      responseBody: response.data != null &&
              response.requestOptions.responseType == ResponseType.json
          ? jsonEncode(response.data)
          : response.data.toString(),
      responseHeaders: response.headers.toString(),
    );
    return handler.next(response);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    ConnectionLog.logResponse(
      url: err.requestOptions.uri.toString(),
      method: err.requestOptions.method,
      responseBody: err.requestOptions.responseType == ResponseType.json
          ? jsonEncode(err.response?.data)
          : err.response?.data.toString(),
      statusCode: err.response?.statusCode,
    );
    return handler.next(err);
  }
}
