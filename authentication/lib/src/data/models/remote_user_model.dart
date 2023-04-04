import '../../domain/domain.dart';

class RemoteUserModel {
  final Map<String, dynamic>? json;
  RemoteUserModel(this.json);

  factory RemoteUserModel.fromJson(Map<String, dynamic> json) {
    return RemoteUserModel(json);
  }

  Map<String, dynamic> toMap() => {
        "id": json?["id"],
        "name": json?["name"],
        "email": json?["email"],
      };

  UserEntity toEntity() =>
      UserEntity(id: json?["id"], name: json?["name"], email: json?["email"]);
}
