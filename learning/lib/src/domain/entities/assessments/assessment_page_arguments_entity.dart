import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';

class AssessmentPageArgumentsEntity extends Equatable {
  const AssessmentPageArgumentsEntity({
    required this.assessmentAttempt,
    required this.attemptNumber,
    required this.contentTitle,
    required this.maxAttempts,
    required this.timeInSeconds,
    required this.visualizeOnly,
    required this.enrollmentId,
  });

  final AssessmentAttemptEntity? assessmentAttempt;
  final int? attemptNumber;
  final String? contentTitle;
  final int? maxAttempts;
  final int? timeInSeconds;
  final bool? visualizeOnly;
  final String? enrollmentId;

  @override
  List get props => [
        assessmentAttempt,
        attemptNumber,
        contentTitle,
        maxAttempts,
        timeInSeconds,
        visualizeOnly,
        enrollmentId,
      ];
}
