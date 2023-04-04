import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';

abstract class SearchPresenter implements Listenable {
  Future<void> init(String? query);

  set search(String value);
  String get search;

  Future<void> doSearch();
  Future<void> nextPage();
  Future<void> loadMostSearches();
  Future<void> loadRecentSearches();
  Future<void> removeSearch(String search);

  ProductsEntity? get mostSearchedProducts;
  bool get isSearchEnabled;

  List<ProductEntity>? get searchedProducts;
  List<String>? get recentSearchesList;
}
