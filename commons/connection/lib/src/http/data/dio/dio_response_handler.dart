import 'package:connection/connection.dart';
import 'package:dio/dio.dart';

class DioResponseHandler {
  static dynamic handle(Response response) {
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      if (response.data != null) {
        return response.data;
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
      if (response.data.isNotEmpty && response.data is Map) {
        error = response.data;
      }
      throw BusinessError(
        statusCode: 422,
        code: error['code'],
        message: error['message'],
      );
    } else {
      throw ServerError(statusCode: response.statusCode ?? 0);
    }
  }
}
