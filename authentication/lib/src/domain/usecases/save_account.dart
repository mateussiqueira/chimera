import 'package:authentication/authentication.dart';

abstract class SaveAccount {
  Future<void> save({required AccountEntity account});
}
