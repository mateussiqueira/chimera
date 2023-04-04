import 'dart:convert';

import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/domain/domain.dart';

class LocalRemoveRecentSearch implements RemoveRecentSearch {
  LocalRemoveRecentSearch({
    required this.storage,
  });

  final CacheStorage storage;

  @override
  Future<void> remove(String search) async {
    try {
      final fetchedData = await storage.fetch(key: 'recent-searches');
      if (fetchedData != null) {
        final list = List<String>.from(jsonDecode(fetchedData));
        list.remove(search);
        await storage.save(
          key: 'recent-searches',
          value: jsonEncode(list),
        );
      }
    } catch (_) {
      throw GenericException;
    }
  }
}
