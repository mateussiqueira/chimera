import 'package:shared_preferences/shared_preferences.dart';

import '../../data/usecases/cache_storage.dart';
import '../../domain/domain.dart';

class PreferencesStorageAdapter implements CacheStorage {
  final Future<SharedPreferences> preferencesStorage;

  PreferencesStorageAdapter({required this.preferencesStorage});

  @override
  Future<bool> delete({required key}) async {
    final storage = await preferencesStorage;
    return storage.remove(key).then((value) {
      if (value == true) {
        return value;
      } else {
        throw DomainError.unexpected;
      }
    });
  }

  @override
  Future fetch({required key}) async {
    final storage = await preferencesStorage;
    final value = storage.get(key);
    return value;
  }

  @override
  Future<bool> save({required key, required value}) async {
    final storage = await preferencesStorage;
    if (value.runtimeType == int) {
      return await storage.setInt(key, value);
    } else if (value.runtimeType == String) {
      return await storage.setString(key, value);
    } else if (value.runtimeType == bool) {
      return await storage.setBool(key, value);
    } else if (value.runtimeType == double) {
      return await storage.setDouble(key, value);
    } else {
      throw DomainError.unexpected;
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      final storage = await preferencesStorage;
      storage.clear();
    } catch (_) {}
  }
}
