import '../../domain.dart';

abstract class LoadCategories {
  Future<List<CategoryEntity>> load();
}
