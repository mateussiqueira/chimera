import 'package:dependencies/dependencies.dart';

class SocialAuthenticationCancelledError extends DomainError {
  SocialAuthenticationCancelledError()
      : super(message: R.string.cancelledAuthentication);
}
