import 'package:discovery/src/domain/domain.dart';

abstract class AddRecentViewedProduct {
  Future<void> add(ProductEntity product);
}
