import '../../domain/domain.dart';

class LocalUserModel extends UserEntity {
  const LocalUserModel({
    required super.id,
    required super.name,
    required super.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory LocalUserModel.fromEntity(UserEntity entity) {
    return LocalUserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
    );
  }

  factory LocalUserModel.fromJson(Map<String, dynamic> map) {
    return LocalUserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }
}
