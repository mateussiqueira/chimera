import '../../../authentication.dart';

abstract class InitUser {
  Future<void> initUser({required AccountEntity account});
}
