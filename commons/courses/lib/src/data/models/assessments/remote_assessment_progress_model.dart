import 'package:courses/src/domain/entities/assessments/assessments.dart';
import 'assessments.dart';

class RemoteAssessmentProgressModel {
  final Map<String, dynamic>? json;

  RemoteAssessmentProgressModel({required this.json});

  AssessmentProgressEntity toEntity() => AssessmentProgressEntity(
        assessment: RemoteAssessmentModel(json: json?['assessment']).toEntity(),
        attempts: json?["attempts"] is List
            ? RemoteAssessmentAttemptModel.toEntityList(json?["attempts"])
            : null,
      );

  static List<AssessmentProgressEntity>? toEntityList(List<dynamic>? list) {
    final result = list
        ?.map((obj) => RemoteAssessmentProgressModel(json: obj).toEntity())
        .toList();
    return result;
  }

  static Map<String, dynamic> toMap(
          AssessmentProgressEntity assessmentProgress) =>
      {
        "assessment":
            RemoteAssessmentModel.toMap(assessmentProgress.assessment),
        "attempts":
            RemoteAssessmentAttemptModel.toMapList(assessmentProgress.attempts),
      };

  static List<dynamic>? toMapList(List<AssessmentProgressEntity>? list) {
    if (list?.isEmpty == true) return null;
    List<Map<String, dynamic>> items = [];
    list?.forEach((element) {
      items.add(RemoteAssessmentProgressModel.toMap(element));
    });
    return items;
  }
}
