import 'package:courses/courses.dart';
import 'package:learning/src/domain/domain.dart';

import 'remote_category_model.dart';
import 'remote_instructor_model.dart';
import 'remote_media_model.dart';

class RemoteCourseModel extends CourseEntity {
  const RemoteCourseModel({
    super.id,
    super.info,
    super.categories,
    super.contentCount,
    super.durationInHours,
    super.firstContent,
    super.instructors,
    super.media,
    super.name,
    super.tree,
  });

  factory RemoteCourseModel.fromJson(
    Map<String, dynamic> json,
    List<String> contentCompletedList,
  ) {
    return RemoteCourseModel(
      id: json['id'],
      categories: List<RemoteCategoryModel>.from(
        json['categories'].map(
          (category) => RemoteCategoryModel.fromJson(category),
        ),
      ),
      contentCount: json['content_count'],
      durationInHours: json['duration_in_hours'],
      firstContent: RemoteContentModel.fromJson(
        json['first_content'],
        contentCompletedList,
      ),
      info: json["info"] != null
          ? RemoteProductInfoModel.fromJson(json["info"])
          : null,
      instructors: List<RemoteInstructorModel>.from(
        json['instructors'].map(
          (instructor) => RemoteInstructorModel.fromJson(instructor),
        ),
      ),
      media: json['media'] != null
          ? RemoteMediaModel.fromJson(json['media'])
          : null,
      name: json['name'],
      tree: json['tree'] != null
          ? RemoteTreeModel.fromJson(json['tree'], contentCompletedList)
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categories':
          categories?.map((e) => (e as RemoteCategoryModel).toMap()).toList(),
      'content_count': contentCount,
      'duration_in_hours': durationInHours,
      'first_content': (firstContent as RemoteContentModel?)?.toMap(),
      'instructors': instructors
          ?.map((e) => (e as RemoteInstructorModel).toMap())
          .toList(),
      'media': (media as RemoteMediaModel?)?.toMap(),
      'name': name,
    };
  }

  CourseEntity copyWith({
    List<CategoryEntity>? categories,
    int? contentCount,
    int? durationInHours,
    ContentEntity? firstContent,
    String? id,
    ProductInfoEntity? info,
    List<InstructorEntity>? instructors,
    MediaEntity? media,
    String? name,
    TreeEntity? tree,
  }) {
    return CourseEntity(
      categories: categories ?? this.categories,
      contentCount: contentCount ?? this.contentCount,
      durationInHours: durationInHours ?? this.durationInHours,
      firstContent: firstContent ?? this.firstContent,
      id: id ?? this.id,
      info: info ?? this.info,
      instructors: instructors ?? this.instructors,
      media: media ?? this.media,
      name: name ?? this.name,
      tree: tree ?? this.tree,
    );
  }
}
