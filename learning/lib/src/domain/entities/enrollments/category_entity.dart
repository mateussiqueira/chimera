import 'package:dependencies/dependencies.dart';

import 'category_info_entity.dart';
import 'media_entity.dart';

class CategoryEntity extends Equatable {
  const CategoryEntity({
    this.description,
    this.id,
    this.info,
    this.name,
    this.media,
    this.slug,
  });

  final String? description;
  final String? id;
  final CategoryInfoEntity? info;
  final MediaEntity? media;
  final String? name;
  final String? slug;

  @override
  List get props => [
        description,
        id,
        info,
        name,
        media,
        slug,
      ];
}
