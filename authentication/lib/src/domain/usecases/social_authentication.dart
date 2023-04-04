import 'package:authentication/src/domain/entities/entities.dart';

abstract class SocialAuthentication {
  Future<AccountEntity> auth(SocialCredentialsEntity credentials);
}
