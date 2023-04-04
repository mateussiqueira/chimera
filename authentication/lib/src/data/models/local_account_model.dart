import 'dart:convert';

import '../../domain/domain.dart';

class LocalAccountModel {
  final AccountEntity? entity;
  final String? json;
  LocalAccountModel({this.entity, this.json});

  factory LocalAccountModel.fromEntity(AccountEntity account) {
    return LocalAccountModel(entity: account);
  }

  factory LocalAccountModel.fromJson(String json) {
    return LocalAccountModel(json: json);
  }

  String toJson() => jsonEncode(
      {"token": entity?.token, "refresh_token": entity?.refreshToken});

  AccountEntity toEntity() {
    final accountJson = jsonDecode(json!);
    return AccountEntity(
        token: accountJson?['token'],
        refreshToken: accountJson?["refresh_token"]);
  }
}
