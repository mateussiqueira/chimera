import '../../../domain/domain.dart';

class RemoteMediaModel {
  final Map<String, dynamic>? json;

  RemoteMediaModel({required this.json});

  factory RemoteMediaModel.fromJson(Map<String, dynamic>? json) =>
      RemoteMediaModel(json: json);

  MediaEntity toEntity() => MediaEntity(cardImage: json?["card_image"]);
}
