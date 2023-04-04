import 'package:storage/src/domain/domain.dart';

abstract class CacheStorage implements Storage {
  Future<void> save({required key, required value});
  @override
  Future<dynamic> fetch({required key});

  Future<void> delete({required key});

  Future<void> clearAll();
}
