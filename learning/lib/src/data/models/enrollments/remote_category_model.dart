import 'package:learning/src/domain/domain.dart';

import 'remote_category_info_model.dart';
import 'remote_media_model.dart';

class RemoteCategoryModel extends CategoryEntity {
  const RemoteCategoryModel({
    super.description,
    super.id,
    super.info,
    super.name,
    super.media,
    super.slug,
  });

  factory RemoteCategoryModel.fromJson(Map<String, dynamic> json) {
    return RemoteCategoryModel(
      id: json['id'],
      description: json['description'],
      info: RemoteCategoryInfoModel.fromJson(json['info']),
      media: json['media'] != null
          ? RemoteMediaModel.fromJson(json['media'])
          : null,
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'id': id,
      'info': info,
      'media': media,
      'name': name,
      'slug': slug,
    };
  }
}
