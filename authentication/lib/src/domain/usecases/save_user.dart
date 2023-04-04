import 'package:authentication/authentication.dart';

abstract class SaveUser {
  Future<void> save({required UserEntity user});
}
