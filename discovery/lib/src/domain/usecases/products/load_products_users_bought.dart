import 'package:discovery/src/domain/domain.dart';

abstract class LoadProductsUsersBought {
  Future<ProductsEntity> load(String id, LoadProductsParams params);
}
