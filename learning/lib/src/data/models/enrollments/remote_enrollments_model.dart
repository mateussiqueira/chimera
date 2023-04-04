import 'package:certificates/certificates.dart';
import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:learning/src/data/data.dart';
import 'package:learning/src/domain/domain.dart';

class RemoteEnrollmentModel extends EnrollmentEntity {
  const RemoteEnrollmentModel({
    super.assessmentProgresses,
    super.certificate,
    super.certificateGoal,
    required super.course,
    super.expireAt,
    super.id,
    super.lastActivityAt,
    super.nextContent,
    super.progressPercentage,
  });

  factory RemoteEnrollmentModel.fromJson(Map<String, dynamic> map) {
    List<String> contentCompletedList = [];
    if (map['progresses'] is List) {
      for (var progress in map['progresses']) {
        contentCompletedList.add(progress['content_id']);
      }
    }
    return RemoteEnrollmentModel(
      assessmentProgresses: map['assessment_progresses'] is List
          ? RemoteAssessmentProgressModel.toEntityList(
              map['assessment_progresses'],
            )
          : null,
      certificate: RemoteCertificateModel(json: map['certificate']).toEntity(),
      certificateGoal:
          RemoteCertificateGoalModel(json: map['certificate_goal']).toEntity(),
      course: RemoteCourseModel.fromJson(map['course'], contentCompletedList),
      expireAt:
          map['expires_at'] != null ? DateTime.parse(map['expires_at']) : null,
      id: map['id'],
      lastActivityAt: map['last_activity_at'] != null
          ? DateTime.parse(map['last_activity_at'])
          : null,
      nextContent: map['next_content'] != null
          ? RemoteContentModel.fromJson(
              map['next_content'],
              contentCompletedList,
            )
          : null,
      progressPercentage: map['progress_percentage'],
    );
  }

  static EnrollmentsEntity fromJsonList(
    List list,
    PaginationEntity? pagination,
  ) {
    return EnrollmentsEntity(
      data: List<EnrollmentEntity>.from(
        list
            .map(
              (e) => RemoteEnrollmentModel.fromJson(e),
            )
            .toList(),
      ),
      pagination: pagination,
    );
  }

  EnrollmentEntity copyWith({
    List<AssessmentProgressEntity>? assessmentProgresses,
    CertificateEntity? certificate,
    CertificateGoalEntity? certificateGoal,
    CourseEntity? course,
    DateTime? expireAt,
    String? id,
    DateTime? lastActivityAt,
    ContentEntity? nextContent,
    int? progressPercentage,
  }) {
    return EnrollmentEntity(
      assessmentProgresses: assessmentProgresses ?? this.assessmentProgresses,
      certificate: certificate ?? this.certificate,
      certificateGoal: certificateGoal ?? this.certificateGoal,
      course: course ?? this.course,
      expireAt: expireAt ?? this.expireAt,
      id: id ?? this.id,
      lastActivityAt: lastActivityAt ?? this.lastActivityAt,
      nextContent: nextContent ?? this.nextContent,
      progressPercentage: progressPercentage ?? this.progressPercentage,
    );
  }
}
