import '../../../domain/domain.dart';
import '../shared/shared.dart';

class RemoteOfferModel {
  RemoteOfferModel({required this.list});

  factory RemoteOfferModel.fromJson(List list) {
    return RemoteOfferModel(list: list);
  }

  final List list;

  OfferEntity toEntity(Map<String, dynamic> json) => OfferEntity(
      id: json["id"],
      name: json["name"],
      price: RemotePriceModel.fromJson(json["price"]).toEntity(),
      product: RemoteProductModel.fromJson(
        json["product"],
      ).toEntity(),
      referencePrice: RemotePriceModel.fromJson(
        json["reference_price"],
      ).toEntity());

  List<OfferEntity> toListEntity() => List.from(
        list.map((e) => toEntity(e)).toList(),
      );
}
