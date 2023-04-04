import '../domain.dart';

abstract class LoadUser {
  Future<UserEntity?> load();
}
