import 'package:courses/courses.dart';
import 'package:discovery/src/data/models/offers/remote_offers_model.dart';

import '../../../domain/domain.dart';
import 'shared.dart';

class RemoteProductModel {
  final Map<String, dynamic> json;

  RemoteProductModel({required this.json});

  factory RemoteProductModel.fromJson(Map<String, dynamic> json) =>
      RemoteProductModel(json: json);

  ProductEntity toEntity() => ProductEntity(
        id: json["id"],
        description: json["description"],
        productableId: json["productable_id"],
        sku: json["sku"],
        media: RemoteMediaModel.fromJson(json["media"]).toEntity(),
        name: json["name"],
        slug: json["slug"],
        availableOffers:
            RemoteLoadOffersModel.fromJson(json['available_offers'])
                .toListEntity(),
        categories: json["categories"] != null
            ? RemoteCategoryModel.fromJson(json["categories"]).toListEntity()
            : null,
        info: json["info"] != null
            ? RemoteProductInfoModel.fromJson(json["info"])
            : null,
        productable: json["productable"] != null
            ? RemoteProductableModel.fromJson(json["productable"])
            : null,
      );
}
