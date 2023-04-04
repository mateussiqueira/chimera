import 'package:authentication/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';

import 'dart:convert';

import '../models/models.dart';

class LocalSaveUser implements SaveUser {
  LocalSaveUser({required this.storage});

  final SecureCacheStorage storage;

  @override
  Future<void> save({required UserEntity user}) async {
    try {
      final localUser = LocalUserModel.fromEntity(user);
      await storage.save(
        key: 'user',
        value: jsonEncode(localUser.toJson()),
      );
    } catch (_) {
      throw GenericException;
    }
  }
}
