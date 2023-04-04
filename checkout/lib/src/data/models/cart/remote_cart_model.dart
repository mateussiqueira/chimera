import 'package:discovery/discovery.dart';

import '../../../domain/domain.dart';

class RemoteCartModel {
  RemoteCartModel({required this.json});

  final Map<String, dynamic> json;

  factory RemoteCartModel.fromJson(Map<String, dynamic> map) {
    if (map.isNotEmpty) {
      return RemoteCartModel(json: map);
    } else {
      return RemoteCartModel(json: {});
    }
  }

  CartEntity toEntity() => CartEntity(
        id: json["id"],
        offers: List.from(json["offers"]).isEmpty
            ? []
            : RemoteLoadOffersModel.fromJson(json["offers"]).toListEntity(),
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
      );
}
