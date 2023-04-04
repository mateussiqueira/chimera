import 'package:learning/src/domain/domain.dart';

class RemoteCategoryInfoModel extends CategoryInfoEntity {
  const RemoteCategoryInfoModel({
    super.courseCount,
    super.enrollmentCount,
    super.userCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'course_count': courseCount,
      'enrollment_count': enrollmentCount,
      'user_count': userCount,
    };
  }

  factory RemoteCategoryInfoModel.fromJson(Map<String, dynamic> map) {
    return RemoteCategoryInfoModel(
      courseCount: map['course_count'],
      enrollmentCount: map['enrollment_count'],
      userCount: map['user_count'],
    );
  }
}
