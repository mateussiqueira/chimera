import '../../../domain/domain.dart';
import 'offers.dart';

class RemoteLoadOffersModel {
  RemoteLoadOffersModel({required this.list});

  factory RemoteLoadOffersModel.fromJson(List<dynamic> list) {
    if (list.isNotEmpty) {
      List<Map<String, dynamic>> mapList = list.cast<Map<String, dynamic>>();
      return RemoteLoadOffersModel(list: mapList);
    } else {
      return RemoteLoadOffersModel(list: [{}]);
    }
  }

  final List<Map<String, dynamic>> list;

  OffersEntity toEntity(Map<String, dynamic> json) => OffersEntity(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        price: json["price"] != null
            ? RemotePriceModel.fromJson(json["price"]).toEntity()
            : null,
        referencePrice: json["reference_price"] != null
            ? RemotePriceModel.fromJson(json["reference_price"]).toEntity()
            : null,
        items: json["items"] != null
            ? RemoteOfferModel.fromJson(json["items"]).toListEntity()
            : null,
        maxInstallments: json["max_installments"] != null
            ? RemoteMaxInstallmentsModel.fromJson(json["max_installments"])
                .toEntity()
            : null,
        media: json["media"] != null
            ? RemoteMediaModel.fromJson(json["media"]).toEntity()
            : null,
      );

  List<OffersEntity> toListEntity() => List.from(
        list.map((e) => toEntity(e)).toList(),
      );
}
