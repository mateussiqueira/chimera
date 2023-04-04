import '../../../domain/entities/assessments/assessments.dart';

class RemoteAlternativeModel {
  final Map<String, dynamic>? json;

  RemoteAlternativeModel({required this.json});

  AlternativeEntity toEntity() => AlternativeEntity(
        id: json?["id"],
        statement: json?["statement"],
      );

  static List<AlternativeEntity>? toEntityList(List<dynamic>? list) {
    final result = list
        ?.map((obj) => RemoteAlternativeModel(json: obj).toEntity())
        .toList();
    return result;
  }

  static Map<String, dynamic> toMap(AlternativeEntity? alternative) => {
        "id": alternative?.id,
        "statement": alternative?.statement,
      };

  static List<dynamic>? toMapList(List<AlternativeEntity>? list) {
    if (list?.isEmpty == true) return null;
    List<Map<String, dynamic>> items = [];
    list?.forEach((element) {
      items.add(RemoteAlternativeModel.toMap(element));
    });
    return items;
  }
}
