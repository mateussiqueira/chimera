import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';

abstract class HomePresenter implements Listenable {
  Future<void> loadRecentViewedProducts();
  Future<void> loadMostSearchedProducts();
  Future<void> loadCategories();
  Future<void> loadProductFromCategory(CategoryEntity category);

  ProductsEntity? get recentViewedProducts;
  ProductsEntity? get mostSearchedProducts;
  ProductsEntity? get selectedCategoryProducts;

  List<CategoryEntity>? get categories;
  CategoryEntity? get selectedCategory;

  LoadProductsParams get recentViewedParams;
  LoadProductsParams get mostSearchedParams;
  LoadProductsParams get selectedCategoryParams;
}
