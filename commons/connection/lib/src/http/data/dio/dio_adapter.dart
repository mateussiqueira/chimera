import 'dart:convert';
import 'dart:typed_data';

import 'package:connection/src/http/data/dio/dio_headers_handler.dart';
import 'package:connection/src/http/data/dio/dio_log_interceptor.dart';
import 'package:connection/src/http/data/dio/dio_refresh_token_interceptor.dart';
import 'package:dependencies/dependencies.dart';
import 'package:dio/dio.dart';

import 'dio_response_handler.dart';

class DioAdapter implements HttpClient {
  DioAdapter({
    Dio? client,
    NetworkConnection? networkConnection,
  })  : client = client ?? Dio(),
        networkConnection = networkConnection ?? NetworkConnectionAdapter() {
    _setupDefaults();
  }

  final Dio client;
  final NetworkConnection networkConnection;

  void _setupDefaults() {
    client.options.connectTimeout = 10000;
  }

  void setupInterceptors({
    required Future<String> Function() refreshToken,
    required Future Function() removeToken,
  }) {
    client.interceptors
      ..add(DioLogInterceptor())
      ..add(DioRefreshTokenInterceptor(
        refreshToken: refreshToken,
        removeToken: removeToken,
        client: client,
      ));
  }

  @override
  Future<HttpResponse> request({
    required String url,
    required String method,
    Map<String, dynamic>? queryParameters,
    Map? body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      bool hasConnection = await networkConnection.hasNetwork();
      if (!hasConnection) {
        throw NoInternetError();
      }
    } catch (error) {
      throw NoInternetError();
    }

    body.removeNullAndEmptyParams();

    final hasBody = (body != null && body.isNotEmpty);
    final jsonBody = hasBody ? jsonEncode(body) : null;

    try {
      final response = await client.request(
        url,
        data: jsonBody,
        queryParameters: queryParameters,
        options: Options(
          method: method,
          headers: headers,
          contentType: 'application/json',
        ),
      );

      return HttpResponse(
        data: DioResponseHandler.handle(response),
        headers: DioHeadersHandler.handle(response),
      );
    } on HttpError catch (_) {
      rethrow;
    } on DioError catch (err) {
      return HttpResponse(
        data: DioResponseHandler.handle(
          Response(
            requestOptions: err.requestOptions,
            data: err.response?.data,
            statusCode: err.response?.statusCode,
          ),
        ),
        headers: DioHeadersHandler.handle(
          Response(
            headers: err.response?.headers,
            requestOptions: err.requestOptions,
          ),
        ),
      );
    } catch (_) {
      throw ServerError(statusCode: _.hashCode);
    }
  }

  @override
  Future<Uint8List> download({
    required String url,
  }) async {
    try {
      bool hasConnection = await networkConnection.hasNetwork();
      if (!hasConnection) {
        throw NoInternetError();
      }
    } catch (error) {
      throw NoInternetError();
    }
    try {
      Uri? uri = Uri.tryParse(url.trim());
      if (uri == null) {
        throw UnexpectedError();
      }
      final response = await client.get(
        url.trim(),
        options: Options(responseType: ResponseType.bytes),
      );
      return response.data;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
