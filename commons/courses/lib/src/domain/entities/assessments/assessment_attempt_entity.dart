import 'package:dependencies/dependencies.dart';
import 'assessments.dart';

class AssessmentAttemptEntity extends Equatable {
  const AssessmentAttemptEntity({
    required this.answers,
    required this.assessmentId,
    required this.expiresAt,
    required this.id,
    required this.questions,
    required this.score,
    required this.status,
  });

  final List<AnswerEntity>? answers;
  final String? assessmentId;
  final DateTime? expiresAt;
  final String? id;
  final List<QuestionEntity>? questions;
  final int? score;
  final AttemptsStatus? status;

  @override
  List get props => [
        answers,
        assessmentId,
        expiresAt,
        id,
        questions,
        status,
      ];

  AssessmentAttemptEntity copyWith(List<AnswerEntity>? newAnswers) {
    return AssessmentAttemptEntity(
      answers: newAnswers,
      assessmentId: assessmentId,
      expiresAt: expiresAt,
      id: id,
      questions: questions,
      score: score,
      status: status,
    );
  }
}
