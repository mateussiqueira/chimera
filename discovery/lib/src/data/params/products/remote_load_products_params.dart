import 'package:discovery/src/domain/domain.dart';

class RemoteLoadProductsParams extends LoadProductsParams {
  const RemoteLoadProductsParams({
    super.query,
    super.productId,
    super.productsIds,
    super.categorySlug,
    super.sort,
    super.page,
    super.items,
  });

  RemoteLoadProductsParams copyWith({
    int? page,
    int? items,
    String? query,
    String? categorySlug,
    String? productId,
    List<String>? productsIds,
    ProductSort? sort,
  }) {
    return RemoteLoadProductsParams(
      page: page ?? this.page,
      items: items ?? this.items,
      query: query ?? this.query,
      categorySlug: categorySlug ?? this.categorySlug,
      productId: productId ?? this.productId,
      productsIds: productsIds ?? this.productsIds,
      sort: sort ?? this.sort,
    );
  }

  Map<String, dynamic> get toQueryParameters {
    return <String, dynamic>{
      'items': items,
      'page': page,
      if (sort != null) 'sort': sort?.apiText,
      if (categorySlug != null) 'filter[category]': categorySlug,
      if (productId != null) 'filter[id]': productId,
      if (query != null) 'filter[q]': query,
      if (productsIds?.isNotEmpty == true) 'filter[id][]': productsIds,
    };
  }
}
