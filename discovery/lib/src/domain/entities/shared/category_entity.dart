import 'package:dependencies/dependencies.dart';

import 'shared.dart';

class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.id,
    required this.name,
    required this.shortName,
    required this.slug,
    required this.description,
    required this.media,
    required this.info,
  });

  final String? id;
  final String? name;
  final String? shortName;
  final String? slug;
  final String? description;
  final MediaEntity? media;
  final InfoEntity? info;

  @override
  List get props => [id, name, shortName, slug, description, media, info];
}
