import 'package:dependencies/dependencies.dart';

import '../entities.dart';

class OfferEntity extends Equatable {
  const OfferEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.referencePrice,
    required this.product,
  });

  final String id;
  final String name;
  final PriceEntity price;
  final PriceEntity referencePrice;
  final ProductEntity product;

  @override
  List get props => [id, name, price, referencePrice, product];
}
