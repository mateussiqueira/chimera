import 'dart:convert';
import 'dart:math';

import 'package:authentication/src/data/data.dart';
import 'package:authentication/src/domain/domain.dart';
import 'package:crypto/crypto.dart';
import 'package:dependencies/dependencies.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleSocialAuthenticationAdapter implements SocialAuthenticationAdapter {
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';

    final random = Random.secure();

    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<SocialCredentialsEntity> auth() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final identityToken = appleCredential.identityToken;
      final uid = appleCredential.userIdentifier;
      final authorizationCode = appleCredential.authorizationCode;
      final fullName = getFullName(appleCredential);

      if (identityToken == null || uid == null) {
        throw UnexpectedError();
      }

      return SocialCredentialsEntity(
        token: identityToken,
        userId: uid,
        provider: SocialProvider.apple,
        fullName: fullName,
        authorizationCode: authorizationCode,
      );
    } on SignInWithAppleAuthorizationException catch (err, stack) {
      if (err.code == AuthorizationErrorCode.canceled) {
        throw SocialAuthenticationCancelledError();
      }
      FirebaseCrashlytics.instance.recordError(err, stack);
      rethrow;
    } on SignInWithAppleCredentialsException catch (err, stack) {
      FirebaseCrashlytics.instance.recordError(err, stack);
      rethrow;
    } catch (err, stack) {
      FirebaseCrashlytics.instance.recordError(err, stack);
      rethrow;
    }
  }

  String? getFullName(AuthorizationCredentialAppleID credentials) {
    String? fullName;
    final givenName = credentials.givenName;
    final familyName = credentials.familyName;
    if (givenName != null && familyName != null) {
      fullName = "$givenName $familyName";
    }
    return fullName ?? 'Usuário ${Random().nextInt(900000) + 100000}';
  }
}
