import 'package:discovery/src/domain/domain.dart';

abstract class LoadProductsBuyTogether {
  Future<List<ProductEntity>> load({required String id});
}
