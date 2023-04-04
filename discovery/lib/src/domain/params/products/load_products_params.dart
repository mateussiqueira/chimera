import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/domain/domain.dart';

abstract class LoadProductsParams extends Equatable {
  const LoadProductsParams({
    this.query,
    this.productId,
    this.productsIds,
    this.categorySlug,
    this.sort,
    this.page = 1,
    this.items = 10,
  });

  final String? query;
  final String? productId;
  final List<String>? productsIds;
  final String? categorySlug;
  final ProductSort? sort;
  final int page;
  final int items;

  @override
  List<Object?> get props => [
        query,
        productId,
        productsIds,
        categorySlug,
        sort,
        page,
        items,
      ];
}
