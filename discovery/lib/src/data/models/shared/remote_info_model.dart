import '../../../domain/domain.dart';

class RemoteInfoModel {
  final Map<String, dynamic>? json;

  RemoteInfoModel({required this.json});

  factory RemoteInfoModel.fromJson(Map<String, dynamic>? json) =>
      RemoteInfoModel(json: json);

  InfoEntity? toEntity() => InfoEntity(
        courseCount: json?["course_count"],
        enrollmentCount: json?["enrollment_count"],
        userCount: json?["user_count"],
      );
}
