import 'package:authentication/src/data/data.dart';
import 'package:authentication/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSocialAuthenticationAdapter implements SocialAuthenticationAdapter {
  @override
  Future<SocialCredentialsEntity> auth() async {
    try {
      final googleSignIn = GoogleSignIn();
      final isAuthenticated = await googleSignIn.isSignedIn();
      if (isAuthenticated) {
        await googleSignIn.disconnect();
      }
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw SocialAuthenticationCancelledError();
      }

      final authentication = await googleUser.authentication;

      return SocialCredentialsEntity(
        token: authentication.accessToken ?? '',
        userId: authentication.idToken ?? '',
        provider: SocialProvider.google,
      );
    } on DomainError catch (_) {
      rethrow;
    } catch (err) {
      throw UnexpectedError();
    }
  }
}
