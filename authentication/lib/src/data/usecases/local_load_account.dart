import 'package:dependencies/dependencies.dart';

import '../models/models.dart';

class LocalLoadAccount implements LoadAccount {
  LocalLoadAccount({required this.storage});

  final SecureCacheStorage storage;

  @override
  Future<AccountEntity> load() async {
    try {
      final future = await storage.fetch(key: 'account');
      if (future != null) {
        return LocalAccountModel.fromJson(future).toEntity();
      } else {
        throw GenericException;
      }
    } catch (_) {
      throw GenericException;
    }
  }
}
