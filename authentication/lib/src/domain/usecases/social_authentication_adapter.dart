import 'package:authentication/src/domain/entities/entities.dart';

abstract class SocialAuthenticationAdapter {
  Future<SocialCredentialsEntity> auth();
}
