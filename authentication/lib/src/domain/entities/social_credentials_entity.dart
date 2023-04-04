import 'package:dependencies/dependencies.dart';

import 'social_provider.dart';

class SocialCredentialsEntity extends Equatable {
  const SocialCredentialsEntity({
    required this.token,
    required this.userId,
    required this.provider,
    this.authorizationCode,
    this.fullName,
  });

  final String token;
  final String userId;
  final String? fullName;
  final String? authorizationCode;
  final SocialProvider provider;

  @override
  List<Object?> get props => [
        token,
        userId,
        fullName,
        authorizationCode,
        provider,
      ];
}
