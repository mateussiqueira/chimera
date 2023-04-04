import '../../../domain/entities/certificates/score_entity.dart';

class RemoteScoreModel {
  final Map<String, dynamic>? json;

  RemoteScoreModel({required this.json});

  ScoreEntity toEntity() => ScoreEntity(
        current: json?["current"],
        required: json?["required"],
      );
}
