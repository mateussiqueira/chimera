import 'package:dependencies/dependencies.dart';

class InvalidCredentialsError extends DomainError {
  InvalidCredentialsError() : super(message: R.string.invalidCredentials);
}
