import '../../../domain/domain.dart';

class RemotePriceModel {
  final Map<String, dynamic>? json;

  RemotePriceModel({required this.json});

  factory RemotePriceModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      return RemotePriceModel(json: json);
    } else {
      return RemotePriceModel(json: {});
    }
  }

  PriceEntity toEntity() => PriceEntity(
        cents: json?["cents"],
        currencyIso: json?["currency_iso"],
      );
}
