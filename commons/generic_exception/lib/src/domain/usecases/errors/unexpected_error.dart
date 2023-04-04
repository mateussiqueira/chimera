import 'package:generic_exception/generic_exception.dart';
import 'package:internationalization/internationalization.dart';

class UnexpectedError extends DomainError {
  UnexpectedError({
    String? message,
    super.code,
  }) : super(message: message ?? R.string.genericErrorMessage);
}
