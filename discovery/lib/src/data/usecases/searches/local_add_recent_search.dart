import 'dart:convert';

import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/domain/domain.dart';

class LocalAddRecentSearch implements AddRecentSearch {
  LocalAddRecentSearch({
    required this.storage,
  });

  final CacheStorage storage;

  @override
  Future<void> add(String search) async {
    try {
      List<String> recentSearches = [
        search,
      ];

      final fetchedData = await storage.fetch(key: 'recent-searches');
      if (fetchedData != null) {
        final list = List<String>.from(jsonDecode(fetchedData));
        recentSearches.addAll(list);
      }

      if (recentSearches.length > 10) {
        recentSearches.removeLast();
      }

      recentSearches = recentSearches.toSet().toList();

      await storage.save(
        key: 'recent-searches',
        value: jsonEncode(recentSearches),
      );
    } catch (_) {
      throw GenericException;
    }
  }
}
