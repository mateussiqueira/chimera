import 'package:checkout/src/domain/domain.dart';

abstract class LoadCart {
  Future<CartEntity> load();
}
