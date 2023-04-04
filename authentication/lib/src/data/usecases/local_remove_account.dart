import 'package:authentication/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';

class LocalRemoveAccount implements RemoveAccount {
  LocalRemoveAccount({required this.storage});

  final SecureCacheStorage storage;

  @override
  Future<void> remove() async {
    try {
      await storage.save(
        key: 'account',
        value: null,
      );
    } catch (_) {
      throw GenericException;
    }
  }
}
