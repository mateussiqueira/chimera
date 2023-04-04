import '../../domain.dart';

abstract class LoadProducts {
  Future<ProductsEntity> load(LoadProductsParams params);
}
