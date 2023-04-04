import 'package:authentication/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';

class LocalRemoveUser implements RemoveUser {
  LocalRemoveUser({required this.storage});

  final SecureCacheStorage storage;

  @override
  Future<void> remove() async {
    try {
      await storage.save(
        key: 'user',
        value: null,
      );
    } catch (_) {
      throw GenericException;
    }
  }
}
