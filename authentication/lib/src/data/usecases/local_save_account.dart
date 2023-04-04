import 'package:authentication/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';

import '../models/models.dart';

class LocalSaveAccount implements SaveAccount {
  LocalSaveAccount({required this.storage});

  final SecureCacheStorage storage;

  @override
  Future<void> save({required AccountEntity account}) async {
    try {
      await storage.save(
        key: 'account',
        value: LocalAccountModel.fromEntity(account).toJson(),
      );
    } catch (_) {
      throw GenericException;
    }
  }
}
