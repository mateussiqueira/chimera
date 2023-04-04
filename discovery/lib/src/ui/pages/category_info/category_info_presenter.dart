import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';

abstract class CategoryInfoPresenter implements Listenable {
  Future<void> init(CategoryEntity category);
  Future<void> load();
  Future<void> nextPage();

  List<ProductEntity>? get products;
}
