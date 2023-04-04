import 'package:http/http.dart';

import '../../domain/http_methods.dart';

class HttpMethods {
  static Future<Response> handle(Client client, String method, Uri uri,
      Map<String, String> defaultHeaders, String? jsonBody) {
    if (method == HttpMethod.post.name) {
      return client.post(
        uri,
        headers: defaultHeaders,
        body: jsonBody,
      );
    } else if (method == HttpMethod.put.name) {
      return client.put(
        uri,
        headers: defaultHeaders,
        body: jsonBody,
      );
    } else if (method == HttpMethod.patch.name) {
      return client.patch(
        uri,
        headers: defaultHeaders,
        body: jsonBody,
      );
    } else if (method == HttpMethod.delete.name) {
      return client.delete(
        uri,
        headers: defaultHeaders,
      );
    } else {
      return client.get(
        uri,
        headers: defaultHeaders,
      );
    }
  }
}
