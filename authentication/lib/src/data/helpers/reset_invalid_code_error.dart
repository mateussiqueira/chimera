import 'package:dependencies/dependencies.dart';

class ResetInvalidCodeError extends DomainError {
  ResetInvalidCodeError() : super(message: R.string.resetInvalidCode);
}
