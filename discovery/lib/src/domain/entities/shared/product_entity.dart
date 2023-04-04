import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/domain/domain.dart';

class ProductEntity extends Equatable {
  const ProductEntity({
    required this.id,
    required this.slug,
    required this.name,
    required this.sku,
    required this.productableId,
    required this.categories,
    required this.availableOffers,
    required this.description,
    required this.media,
    required this.info,
    required this.productable,
  });

  final String? id;
  final String? slug;
  final String? name;
  final String? sku;
  final String? productableId;
  final List<CategoryEntity>? categories;
  final List<OffersEntity>? availableOffers;
  final String? description;
  final MediaEntity? media;
  final ProductInfoEntity? info;
  final ProductableEntity? productable;

  @override
  List get props => [
        id,
        slug,
        name,
        sku,
        productableId,
        categories,
        availableOffers,
        description,
        media
      ];
}
