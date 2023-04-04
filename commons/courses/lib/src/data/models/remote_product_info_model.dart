import '../../domain/entities/entities.dart';

class RemoteProductInfoModel extends ProductInfoEntity {
  const RemoteProductInfoModel({required super.goals});

  factory RemoteProductInfoModel.fromJson(Map<String, dynamic> map) {
    return RemoteProductInfoModel(
      goals: map['goals'] != null
          ? List<String>.from(
              map['goals'],
            )
          : null,
    );
  }
}
