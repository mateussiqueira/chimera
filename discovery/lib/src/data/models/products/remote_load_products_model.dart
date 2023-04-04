import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';

import '../../../domain/domain.dart';
import '../offers/offers.dart';

class RemoteLoadProductsModel {
  final List<Map<String, dynamic>> list;

  RemoteLoadProductsModel({required this.list});

  factory RemoteLoadProductsModel.fromJson(List<Map<String, dynamic>> list) =>
      RemoteLoadProductsModel(list: list);

  ProductEntity toEntity(Map<String, dynamic> json) => ProductEntity(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        availableOffers:
            RemoteLoadOffersModel.fromJson(json["available_offers"])
                .toListEntity(),
        categories:
            RemoteCategoryModel.fromJson(json["categories"]).toListEntity(),
        description: json["description"],
        productableId: json["productable_id"],
        sku: json["sku"],
        media: RemoteMediaModel.fromJson(json["media"]).toEntity(),
        info: json["info"] != null
            ? RemoteProductInfoModel.fromJson(json["info"])
            : null,
        productable: json["productable"] != null
            ? RemoteProductableModel.fromJson(json["productable"])
            : null,
      );

  static ProductsEntity fromJsonList(
    List list,
    PaginationEntity? pagination,
  ) {
    return ProductsEntity(
      data: List<ProductEntity>.from(
        list
            .map(
              (e) => RemoteProductModel(json: e).toEntity(),
            )
            .toList(),
      ),
      pagination: pagination,
    );
  }

  List<ProductEntity> toListEntity() => list.map((e) => toEntity(e)).toList();
}
