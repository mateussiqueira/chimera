import '../../../domain/domain.dart';
import '../models.dart';

class RemoteLoadCategoriesModel {
  RemoteLoadCategoriesModel({required this.list});

  factory RemoteLoadCategoriesModel.fromJson(List list) {
    return RemoteLoadCategoriesModel(list: list);
  }

  final List list;

  CategoryEntity toEntity(Map<String, dynamic> json) => CategoryEntity(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        shortName: json["short_name"],
        description: json["description"],
        media: RemoteMediaModel.fromJson(json["media"]).toEntity(),
        info: RemoteInfoModel.fromJson(json["info"]).toEntity(),
      );

  List<CategoryEntity> toListEntity() => List.from(
        list.map((e) => toEntity(e)).toList(),
      );
}
