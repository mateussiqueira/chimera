import '../../../domain/entities/assessments/assessments.dart';

class RemoteAnswerModel {
  final Map<String, dynamic>? json;

  RemoteAnswerModel({required this.json});

  AnswerEntity toEntity() => AnswerEntity(
        alternativeId: json?["alternative_id"],
        questionId: json?["question_id"],
      );

  static List<AnswerEntity>? toEntityList(List<dynamic>? list) {
    final result =
        list?.map((obj) => RemoteAnswerModel(json: obj).toEntity()).toList();
    return result;
  }

  static Map<String, dynamic> toMap(AnswerEntity? answer) => {
        "alternative_id": answer?.alternativeId,
        "question_id": answer?.questionId,
      };

  static List<dynamic>? toMapList(List<AnswerEntity>? list) {
    if (list?.isEmpty == true) return null;
    List<Map<String, dynamic>> items = [];
    list?.forEach((element) {
      items.add(RemoteAnswerModel.toMap(element));
    });
    return items;
  }
}
