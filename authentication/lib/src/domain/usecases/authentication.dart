import 'package:authentication/src/domain/usecases/params/params.dart';

import '../entities/entities.dart';

abstract class Authentication {
  Future<AccountEntity> auth({required AuthenticationParams params});
}
