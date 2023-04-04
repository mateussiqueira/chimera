import 'dart:convert';

import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/domain/domain.dart';

class LocalLoadRecentSearches implements LoadRecentSearches {
  LocalLoadRecentSearches({
    required this.storage,
  });

  final CacheStorage storage;

  @override
  Future<List<String>> load() async {
    try {
      List<String> recentSearches = [];

      final data = await storage.fetch(key: 'recent-searches');
      if (data != null) {
        recentSearches = List<String>.from(jsonDecode(data));
      }

      return recentSearches;
    } catch (_) {
      throw GenericException;
    }
  }
}
