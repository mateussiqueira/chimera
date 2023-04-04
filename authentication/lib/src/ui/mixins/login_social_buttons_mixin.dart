import 'package:authentication/src/domain/domain.dart';

mixin LoginSocialButtonsMixin {
  bool isGoogleEnabled();
  bool isAppleEnabled();
  bool shouldShowLoginSocialButtons();
  Future<bool> loginWithGoogle();
  Future<bool> loginWithApple();
  late SocialAuthenticationAdapter googleAuthentication;
  late SocialAuthenticationAdapter appleAuthentication;
  late SocialAuthentication remoteSocialAuthentication;
  late SaveAccount localSaveAccount;
  late InitUser remoteInitUser;
}
