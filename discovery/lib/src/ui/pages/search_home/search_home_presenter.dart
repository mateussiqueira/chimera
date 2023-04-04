import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';

abstract class SearchHomePresenter implements Listenable {
  void loadCategories();

  List<CategoryEntity> get categories;
  LoadProductsParams get topSearchedParams;
  LoadProductsParams get mostPurchasedParams;
}
