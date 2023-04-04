import 'package:dependencies/dependencies.dart';

class NoInternetError extends GenericException {}

abstract class HttpError extends GenericException {
  HttpError({
    required this.statusCode,
    super.message,
  });

  final int statusCode;
}

class BadRequest extends HttpError {
  BadRequest({required super.statusCode});
}

class BusinessError extends HttpError {
  BusinessError({
    required super.statusCode,
    this.code,
    super.message,
  });

  final String? code;
}

class ForbiddenError extends HttpError {
  ForbiddenError({required super.statusCode});
}

class ServerError extends HttpError {
  ServerError({required super.statusCode});
}

class NotAuthorizedError extends HttpError {
  NotAuthorizedError({required super.statusCode});
}

class NotFound extends HttpError {
  NotFound({required super.statusCode, super.message});
}

class RequestConflict extends HttpError {
  RequestConflict({required super.statusCode});
}
