import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';

abstract class ProductPresenter extends UpdatePresenter {
  Future<void> init(ProductEntity product);
  Future<void> load();
  Future<void> loadProductsUsersBought();
  Future<void> shareProduct();
  void setNavFixed(bool value);

  ProductEntity? get product;
  ProductsEntity? get productsUsersBought;
  LoadProductsParams get productsUsersBoughtParams;
  bool get bottomNavFixed;
}
