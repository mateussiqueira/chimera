import '../../domain/entities/account_entity.dart';

class RemoteAccountModel {
  final String token;
  final String refreshToken;
  final AccountEntity? account;
  RemoteAccountModel(this.token, this.refreshToken, [this.account]);

  factory RemoteAccountModel.fromJson(Map json) {
    return RemoteAccountModel(json['token'], json['refresh_token']);
  }

  Map<String, dynamic> toMap() =>
      {"token": token, "refresh_token": refreshToken};

  AccountEntity toEntity() =>
      AccountEntity(token: token, refreshToken: refreshToken);
}
