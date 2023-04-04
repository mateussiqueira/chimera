import '../../../domain/domain.dart';
import 'shared.dart';

class RemoteMaxInstallmentsModel {
  final Map<String, dynamic>? json;

  RemoteMaxInstallmentsModel({required this.json});

  factory RemoteMaxInstallmentsModel.fromJson(Map<String, dynamic>? json) =>
      RemoteMaxInstallmentsModel(json: json);

  MaxInstallmentsEntity? toEntity() => MaxInstallmentsEntity(
      times: json?["times"],
      total: RemotePriceModel.fromJson(json?["total"]).toEntity());
}
