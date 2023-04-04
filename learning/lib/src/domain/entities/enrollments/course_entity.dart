import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';

import 'category_entity.dart';
import 'instructor_entity.dart';
import 'media_entity.dart';

class CourseEntity extends Equatable {
  const CourseEntity({
    this.categories,
    this.contentCount,
    this.durationInHours,
    this.firstContent,
    this.id,
    this.info,
    this.instructors,
    this.media,
    this.name,
    this.tree,
  });

  final List<CategoryEntity>? categories;
  final int? contentCount;
  final int? durationInHours;
  final ContentEntity? firstContent;
  final String? id;
  final ProductInfoEntity? info;
  final List<InstructorEntity>? instructors;
  final MediaEntity? media;
  final String? name;
  final TreeEntity? tree;

  @override
  List get props => [
        categories,
        contentCount,
        durationInHours,
        firstContent,
        id,
        instructors,
        media,
        name,
        tree,
      ];
}
