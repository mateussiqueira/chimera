import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:storage/src/data/data.dart';

import '../../domain/domain.dart';

class SecureStorageAdapter implements SecureCacheStorage {
  final FlutterSecureStorage secureStorage;

  SecureStorageAdapter({required this.secureStorage});
  @override
  Future save({required key, required value}) async =>
      await secureStorage.write(key: key, value: value);

  @override
  Future<String?> fetch({required key}) async {
    try {
      return await secureStorage.read(key: key);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }

  @override
  Future delete({required key}) async => await secureStorage.delete(key: key);

  @override
  Future<void> clearAll() async {
    try {
      await secureStorage.deleteAll();
    } catch (_) {}
  }
}
