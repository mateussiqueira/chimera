import '../../../domain/entities/assessments/assessments.dart';

class RemoteAssessmentModel {
  final Map<String, dynamic>? json;

  RemoteAssessmentModel({required this.json});

  AssessmentEntity toEntity() => AssessmentEntity(
        id: json?["id"],
        maxAttempts: json?["max_attempts"],
        name: json?["name"],
        passingScore: json?["passing_score"],
        timeInSeconds: json?["time_in_seconds"],
      );

  static List<AssessmentEntity>? toEntityList(List<dynamic>? list) {
    final result = list
        ?.map((obj) => RemoteAssessmentModel(json: obj).toEntity())
        .toList();
    return result;
  }

  static Map<String, dynamic> toMap(AssessmentEntity? assessment) => {
        "id": assessment?.id,
        "max_attempts": assessment?.maxAttempts,
        "name": assessment?.name,
        "passing_score": assessment?.passingScore,
        "time_in_seconds": assessment?.timeInSeconds,
      };

  static List<dynamic>? toMapList(List<AssessmentEntity>? list) {
    if (list?.isEmpty == true) return null;
    List<Map<String, dynamic>> items = [];
    list?.forEach((element) {
      items.add(RemoteAssessmentModel.toMap(element));
    });
    return items;
  }
}
