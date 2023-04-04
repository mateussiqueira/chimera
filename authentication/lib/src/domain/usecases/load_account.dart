import 'package:authentication/authentication.dart';

abstract class LoadAccount {
  Future<AccountEntity> load();
}
