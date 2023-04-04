import 'dart:convert';

import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/domain/domain.dart';

class LocalLoadRecentlyViewedProducts implements LoadRecentlyViewedProducts {
  LocalLoadRecentlyViewedProducts({
    required this.storage,
  });

  final CacheStorage storage;

  @override
  Future<List<String>> load() async {
    try {
      List<String> recentViewedProducts = [];

      final data = await storage.fetch(key: 'recent-viewed-products');
      if (data != null) {
        recentViewedProducts = List<String>.from(jsonDecode(data));
      }

      return recentViewedProducts;
    } catch (_) {
      throw GenericException;
    }
  }
}
