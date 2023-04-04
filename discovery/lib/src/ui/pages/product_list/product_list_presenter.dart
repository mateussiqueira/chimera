import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';

abstract class ProductListPresenter implements Listenable {
  Future<void> init(LoadProductsParams params);
  Future<void> load();
  Future<void> nextPage();

  LoadProductsParams? params;
  PaginationEntity? pagination;

  List<ProductEntity>? get products;
}
