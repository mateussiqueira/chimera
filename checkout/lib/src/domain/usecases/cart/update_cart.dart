import 'package:checkout/src/domain/domain.dart';

abstract class UpdateCart {
  Future<CartEntity> update({required List<String> offerIds});
}
