import 'dart:convert';

import 'package:dependencies/dependencies.dart';

import '../../../authentication.dart';
import '../models/models.dart';

class LocalLoadUser implements LoadUser {
  LocalLoadUser({required this.storage});

  final SecureCacheStorage storage;

  @override
  Future<UserEntity?> load() async {
    try {
      final json = await storage.fetch(key: 'user');
      if (json != null) {
        return LocalUserModel.fromJson(jsonDecode(json));
      } else {
        return null;
      }
    } catch (_) {
      throw GenericException;
    }
  }
}
