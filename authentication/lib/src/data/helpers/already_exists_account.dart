import 'package:dependencies/dependencies.dart';

class AlreadyExistsAccountError extends DomainError {
  AlreadyExistsAccountError() : super(message: R.string.alreadyExistsAccount);
}
