import 'package:dependencies/dependencies.dart';

class AccountEntity extends Equatable {
  const AccountEntity({
    required this.token,
    required this.refreshToken,
  });

  final String token;
  final String refreshToken;

  @override
  List get props => [
        token,
        refreshToken,
      ];
}
