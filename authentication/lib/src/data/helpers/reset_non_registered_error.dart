import 'package:dependencies/dependencies.dart';

class ResetNonRegisteredError extends DomainError {
  ResetNonRegisteredError() : super(message: R.string.resetNonRegisteredEmail);
}
