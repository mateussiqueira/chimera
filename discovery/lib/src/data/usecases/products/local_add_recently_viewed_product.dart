import 'dart:convert';

import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/domain/domain.dart';

class LocalAddRecentViewedProduct implements AddRecentViewedProduct {
  LocalAddRecentViewedProduct({
    required this.storage,
  });

  final CacheStorage storage;

  @override
  Future<void> add(ProductEntity product) async {
    try {
      final id = product.id;
      List<String> recentViewedProducts = [
        if (id != null) id,
      ];

      final fetchedData = await storage.fetch(key: 'recent-viewed-products');
      if (fetchedData != null) {
        final list = List<String>.from(jsonDecode(fetchedData));
        recentViewedProducts.addAll(list);
      }

      if (recentViewedProducts.length > 15) {
        recentViewedProducts.removeLast();
      }

      recentViewedProducts = recentViewedProducts.toSet().toList();

      await storage.save(
        key: 'recent-viewed-products',
        value: jsonEncode(recentViewedProducts),
      );
    } catch (_) {
      throw GenericException;
    }
  }
}
