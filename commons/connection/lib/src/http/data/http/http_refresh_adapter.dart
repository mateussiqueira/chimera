import 'dart:io';

import 'package:connection/connection.dart';

class HttpRefreshAdapter extends HttpAdapter {
  HttpRefreshAdapter({
    super.client,
    super.networkConnection,
    super.httpResult,
    required this.refreshToken,
    required this.removeToken,
  });

  final Future<String> Function() refreshToken;
  final Future Function() removeToken;

  @override
  Future<HttpResponse> request({
    required String url,
    required String method,
    Map<String, dynamic>? queryParameters,
    Map? body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      return await super.request(
        url: url,
        method: method,
        queryParameters: queryParameters,
        body: body,
        headers: headers,
      );
    } on NotAuthorizedError catch (e) {
      final hasBearer = _hasBearer(headers);
      if (headers != null && hasBearer) {
        try {
          final newToken = await refreshToken();
          headers[HttpHeaders.authorizationHeader] = getBearerToken(newToken);
          return super.request(
            url: url,
            method: method,
            queryParameters: queryParameters,
            body: body,
            headers: headers,
          );
        } catch (_) {
          await removeToken();
          throw e;
        }
      }
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  bool _hasBearer(Map<dynamic, dynamic>? headers) {
    return headers?.containsKey(HttpHeaders.authorizationHeader) ?? false;
  }
}
