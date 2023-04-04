import 'dart:convert';
import 'dart:typed_data';

import 'package:dependencies/dependencies.dart';
import 'package:http/http.dart';

class HttpAdapter implements HttpClient {
  HttpAdapter({
    Client? client,
    NetworkConnection? networkConnection,
    HttpResult? httpResult,
  })  : client = client ?? Client(),
        networkConnection = networkConnection ?? NetworkConnectionAdapter(),
        httpResult = httpResult ?? HttpResponseData();

  final Client client;
  final NetworkConnection networkConnection;
  final HttpResult httpResult;

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

    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
      });

    body.removeNullAndEmptyParams();

    final hasBody = (body != null && body.isNotEmpty);
    final jsonBody = hasBody ? jsonEncode(body) : null;

    var response = Response('', 500);
    try {
      Uri uri = HttpParameters.addToUrl(url, queryParameters);
      ConnectionLog.logRequest(
        uri: uri,
        method: method,
        headers: defaultHeaders.toString(),
        body: body?.toString(),
      );

      response = await HttpMethods.handle(
        client,
        method,
        uri,
        defaultHeaders,
        jsonBody,
      );

      ConnectionLog.logResponse(
        url: response.request?.url.toString(),
        method: response.request?.method,
        statusCode: response.statusCode,
        responseBody: utf8.decode(response.bodyBytes),
        responseHeaders: response.headers.toString(),
      );

      return HttpResponse(
        data: await httpResult.handle(response),
        headers: response.headers,
      );
    } on HttpError catch (_) {
      rethrow;
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
      return await client.readBytes(uri);
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
