import 'package:connection/connection.dart';
import 'package:dio/dio.dart';

class DioRefreshTokenInterceptor extends Interceptor {
  DioRefreshTokenInterceptor({
    required this.refreshToken,
    required this.removeToken,
    required this.client,
  });

  final Future<String> Function() refreshToken;
  final Future Function() removeToken;
  final Dio client;

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final newToken = await refreshToken();
        final response = await _retry(err.requestOptions, newToken);
        return handler.resolve(response);
      } catch (_) {
        await removeToken();
        return handler.next(err);
      }
    }
    return handler.next(err);
  }

  Future<Response<dynamic>> _retry(
    RequestOptions requestOptions,
    String newToken,
  ) {
    return client.request<dynamic>(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        sendTimeout: requestOptions.sendTimeout,
        receiveTimeout: requestOptions.receiveTimeout,
        extra: requestOptions.extra,
        headers: requestOptions.headers..addAll(getDefaultHeaders(newToken)),
        responseType: requestOptions.responseType,
        contentType: requestOptions.contentType,
        validateStatus: requestOptions.validateStatus,
        receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
        followRedirects: requestOptions.followRedirects,
        maxRedirects: requestOptions.maxRedirects,
        requestEncoder: requestOptions.requestEncoder,
        responseDecoder: requestOptions.responseDecoder,
        listFormat: requestOptions.listFormat,
      ),
    );
  }
}
