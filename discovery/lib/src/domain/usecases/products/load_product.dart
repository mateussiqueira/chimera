import 'package:discovery/src/domain/domain.dart';

abstract class LoadProduct {
  Future<ProductEntity> load({required String slug});
}
