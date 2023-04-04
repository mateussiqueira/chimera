import '../../../domain/domain.dart';
import 'shared.dart';

class RemoteCategoryModel {
  RemoteCategoryModel({required this.list});

  factory RemoteCategoryModel.fromJson(List list) {
    return RemoteCategoryModel(list: list);
  }

  final List list;

  CategoryEntity toEntity(Map<String, dynamic> json) => CategoryEntity(
        id: json["id"],
        description: json["description"],
        info: json["info"] != null
            ? RemoteInfoModel.fromJson(json["info"]).toEntity()
            : null,
        media: json["media"] != null
            ? RemoteMediaModel.fromJson(json["media"]).toEntity()
            : null,
        name: json["name"],
        shortName: json["short_name"],
        slug: json["slug"],
      );

  List<CategoryEntity>? toListEntity() => List.from(
        list.map((e) => toEntity(e)).toList(),
      );
}
