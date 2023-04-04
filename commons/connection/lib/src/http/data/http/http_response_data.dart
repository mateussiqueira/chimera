import 'dart:convert';

import 'package:connection/connection.dart';
import 'package:http/http.dart';

class HttpResponseData implements HttpResult {
  @override
  Future<dynamic> handle(Response response) async {
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      if (response.body.isNotEmpty) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        return {};
      }
    } else if (response.statusCode == 204) {
      return {};
    } else if (response.statusCode == 400) {
      throw BadRequest(statusCode: 400);
    } else if (response.statusCode == 401) {
      throw NotAuthorizedError(statusCode: 401);
    } else if (response.statusCode == 403) {
      throw ForbiddenError(statusCode: 403);
    } else if (response.statusCode == 404) {
      throw NotFound(statusCode: 404);
    } else if (response.statusCode == 409) {
      throw RequestConflict(statusCode: 409);
    } else if (response.statusCode == 422) {
      var error = {};
      if (response.body.isNotEmpty) {
        error = jsonDecode(utf8.decode(response.bodyBytes));
      }
      throw BusinessError(
        statusCode: 422,
        code: error['code'],
        message: error['message'],
      );
    } else {
      throw ServerError(statusCode: response.statusCode);
    }
  }
}
