import 'package:certificates/certificates.dart';
import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:learning/src/domain/domain.dart';

class EnrollmentEntity extends Equatable {
  const EnrollmentEntity({
    this.assessmentProgresses,
    this.certificate,
    this.certificateGoal,
    required this.course,
    this.expireAt,
    this.id,
    this.lastActivityAt,
    this.nextContent,
    this.progressPercentage,
  });

  final List<AssessmentProgressEntity>? assessmentProgresses;
  final CertificateEntity? certificate;
  final CertificateGoalEntity? certificateGoal;
  final CourseEntity course;
  final DateTime? expireAt;
  final String? id;
  final DateTime? lastActivityAt;
  final ContentEntity? nextContent;
  final int? progressPercentage;

  @override
  List get props => [
        assessmentProgresses,
        certificate,
        certificateGoal,
        course,
        expireAt,
        id,
        lastActivityAt,
        progressPercentage,
      ];
}
