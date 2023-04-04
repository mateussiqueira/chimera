import 'package:dependencies/dependencies.dart';

import '../entities.dart';

class OffersEntity extends Equatable {
  const OffersEntity({
    required this.id,
    required this.slug,
    required this.name,
    required this.price,
    required this.referencePrice,
    required this.items,
    required this.maxInstallments,
    required this.media,
  });

  final String? id;
  final String? slug;
  final String? name;
  final PriceEntity? price;
  final PriceEntity? referencePrice;
  final List<OfferEntity>? items;
  final MaxInstallmentsEntity? maxInstallments;
  final MediaEntity? media;

  @override
  List get props => [
        id,
        slug,
        name,
        price,
        referencePrice,
        items,
        maxInstallments,
        media,
      ];
}
