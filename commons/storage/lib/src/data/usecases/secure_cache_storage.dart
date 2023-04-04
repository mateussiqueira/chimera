import 'package:storage/src/domain/domain.dart';

abstract class SecureCacheStorage implements Storage {
  Future<void> save({required key, required value});
  Future<String?> fetch({required key});
  Future delete({required key});
  Future<void> clearAll();
}
