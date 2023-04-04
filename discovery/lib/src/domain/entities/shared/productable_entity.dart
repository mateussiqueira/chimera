import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';

import 'category_entity.dart';
import 'instructor_entity.dart';

class ProductableEntity extends Equatable {
  const ProductableEntity({
    required this.categories,
    required this.durationInHours,
    required this.id,
    required this.instructors,
    required this.tree,
  });

  final List<CategoryEntity>? categories;
  final int? durationInHours;
  final String? id;
  final List<InstructorEntity>? instructors;
  final TreeEntity? tree;

  @override
  List get props => [
        categories,
        durationInHours,
        id,
        instructors,
        tree,
      ];
}
