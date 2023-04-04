import 'package:courses/courses.dart';
import 'package:discovery/src/domain/domain.dart';

import 'remote_category_model.dart';
import 'remote_instructor_model.dart';

class RemoteProductableModel extends ProductableEntity {
  const RemoteProductableModel({
    required super.categories,
    required super.durationInHours,
    required super.id,
    required super.instructors,
    required super.tree,
  });

  factory RemoteProductableModel.fromJson(Map<String, dynamic> json) {
    return RemoteProductableModel(
      id: json['id'],
      categories: json["categories"] != null
          ? RemoteCategoryModel.fromJson(json["categories"]).toListEntity()
          : null,
      durationInHours: json["duration_in_hours"],
      instructors: json["categories"] != null
          ? List<RemoteInstructorModel>.from(
              json['instructors'].map(
                (instructor) => RemoteInstructorModel.fromJson(instructor),
              ),
            )
          : null,
      tree: json['tree'] != null
          ? RemoteTreeModel.fromJson(
              json['tree'],
              const [],
            )
          : null,
    );
  }
}
