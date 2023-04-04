class ProductConfiguration {
  const ProductConfiguration({
    required String productUrl,
  }) : _productUrl = productUrl;

  final String _productUrl;

  String url({required String slug}) => '$_productUrl/$slug';
}
