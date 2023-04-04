import 'package:learning/src/domain/domain.dart';

class RemoteMediaModel extends MediaEntity {
  const RemoteMediaModel({
    super.cardImage,
    super.headerImage,
  });

  factory RemoteMediaModel.fromJson(Map<String, dynamic> map) {
    return RemoteMediaModel(
      cardImage: map['card_image'],
      headerImage: map['header_image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'card_image': cardImage,
      'header_image': headerImage,
    };
  }
}
