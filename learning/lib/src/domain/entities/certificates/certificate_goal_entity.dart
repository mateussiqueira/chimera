import 'package:dependencies/dependencies.dart';

import 'score_entity.dart';

class CertificateGoalEntity extends Equatable {
  const CertificateGoalEntity({
    this.completedContents,
    this.minAssessmentsScore,
    this.passedAssessments,
  });

  final ScoreEntity? completedContents;
  final ScoreEntity? minAssessmentsScore;
  final ScoreEntity? passedAssessments;

  @override
  List get props => [completedContents, minAssessmentsScore, passedAssessments];
}
