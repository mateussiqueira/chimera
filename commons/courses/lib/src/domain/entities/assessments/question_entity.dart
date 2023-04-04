import 'package:dependencies/dependencies.dart';

import 'assessments.dart';

class QuestionEntity extends Equatable {
  const QuestionEntity({
    required this.alternativeId,
    required this.alternatives,
    required this.feedback,
    required this.id,
    required this.statement,
    required this.status,
  });

  final String? alternativeId;
  final List<AlternativeEntity>? alternatives;
  final String? feedback;
  final String? id;

  final String? statement;
  final AssessmentAnswerStatus? status;

  @override
  List get props => [
        alternativeId,
        alternatives,
        feedback,
        id,
        statement,
        status,
      ];
}
