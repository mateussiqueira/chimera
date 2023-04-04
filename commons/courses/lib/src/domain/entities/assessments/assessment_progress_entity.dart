import 'package:dependencies/dependencies.dart';

import 'assessments.dart';

class AssessmentProgressEntity extends Equatable {
  const AssessmentProgressEntity({
    this.assessment,
    this.attempts,
  });

  final AssessmentEntity? assessment;
  final List<AssessmentAttemptEntity>? attempts;

  @override
  List get props => [assessment, attempts];
}
