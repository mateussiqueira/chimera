import 'package:authentication/authentication.dart';

class RemoteSocialAuthenticationParams {
  RemoteSocialAuthenticationParams({
    required this.token,
    required this.provider,
    required this.userId,
    this.authorizationCode,
    this.fullName,
  });

  final String token;
  final SocialProvider provider;
  final String userId;
  final String? authorizationCode;
  final String? fullName;

  factory RemoteSocialAuthenticationParams.fromCredentials(
    SocialCredentialsEntity credentials,
  ) {
    return RemoteSocialAuthenticationParams(
      token: credentials.token,
      userId: credentials.userId,
      fullName: credentials.fullName,
      provider: credentials.provider,
      authorizationCode: credentials.authorizationCode,
    );
  }

  Map<String, dynamic> toJson() {
    switch (provider) {
      case SocialProvider.apple:
        return {
          "token": token,
          "user_id": userId,
          "full_name": fullName,
          "authorization_code": authorizationCode,
        };
      case SocialProvider.facebook:
        return {
          "token": token,
        };
      case SocialProvider.google:
        return {
          "type": "assertion",
          "value": token,
        };
    }
  }
}
