import '../entities/entities.dart';
import 'params/add_account_params.dart';

abstract class AddAccount {
  Future<AccountEntity> add(AddAccountParams params);
}
