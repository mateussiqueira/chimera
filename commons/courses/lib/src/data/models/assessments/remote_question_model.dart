import 'package:courses/src/domain/entities/assessments/assessments.dart';
import 'assessments.dart';

class RemoteQuestionModel {
  final Map<String, dynamic>? json;

  RemoteQuestionModel({required this.json});

  QuestionEntity toEntity() => QuestionEntity(
        alternativeId: json?["alternative_id"],
        alternatives:
            RemoteAlternativeModel.toEntityList(json?["alternatives"]),
        feedback: json?["feedback"],
        id: json?["id"],
        statement: json?["statement"],
        status: AssessmentAnswerStatusExtension.assessmentAnswerStatusByApiText(
            json?["status"]),
      );

  static List<QuestionEntity>? toEntityList(List<dynamic>? list) {
    final result =
        list?.map((obj) => RemoteQuestionModel(json: obj).toEntity()).toList();
    return result;
  }

  static Map<String, dynamic> toMap(QuestionEntity? question) => {
        "alternative_id": question?.alternativeId,
        "alternatives":
            RemoteAlternativeModel.toMapList(question?.alternatives),
        "feedback": question?.feedback,
        "id": question?.id,
        "statement": question?.statement,
        "status": question?.status?.name
      };

  static List<dynamic>? toMapList(List<QuestionEntity>? list) {
    if (list?.isEmpty == true) return null;
    List<Map<String, dynamic>> items = [];
    list?.forEach((element) {
      items.add(RemoteQuestionModel.toMap(element));
    });
    return items;
  }
}
