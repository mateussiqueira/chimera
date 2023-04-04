import '../../../domain/entities/assessments/assessments.dart';
import 'assessments.dart';

class RemoteAssessmentAttemptModel {
  final Map<String, dynamic>? json;

  RemoteAssessmentAttemptModel({required this.json});

  AssessmentAttemptEntity toEntity() => AssessmentAttemptEntity(
        answers: RemoteAnswerModel.toEntityList(json?["answers"]),
        assessmentId: json?["assessment_id"],
        expiresAt: json?["expires_at"] != null
            ? DateTime.parse(json?["expires_at"])
            : null,
        id: json?["id"],
        questions: RemoteQuestionModel.toEntityList(json?["questions"]),
        score: json?["score"],
        status: AttemptsStatusHelpers.fromString(json?["status"]),
      );

  static List<AssessmentAttemptEntity>? toEntityList(List<dynamic>? list) {
    final result = list
        ?.map((obj) => RemoteAssessmentAttemptModel(json: obj).toEntity())
        .toList();
    return result;
  }

  static Map<String, dynamic> toMap(AssessmentAttemptEntity? attempt) => {
        "answers": RemoteAnswerModel.toMapList(attempt?.answers),
        "assessment_id": attempt?.assessmentId,
        "expires_at": attempt?.expiresAt,
        "id": attempt?.id,
        "questions": RemoteQuestionModel.toMapList(attempt?.questions),
        "score": attempt?.score,
        "status": attempt?.status,
      };

  static List<dynamic>? toMapList(List<AssessmentAttemptEntity>? list) {
    if (list?.isEmpty == true) return null;
    List<Map<String, dynamic>> items = [];
    list?.forEach((element) {
      items.add(RemoteAssessmentAttemptModel.toMap(element));
    });
    return items;
  }
}
