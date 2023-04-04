import 'package:authentication/src/domain/domain.dart';

import '../data.dart';

class LocalUserIsLoggedIn implements UserIsLoggedIn {
  LocalUserIsLoggedIn({
    required this.loadAccount,
    required this.tokenAdapter,
  });

  final LoadAccount loadAccount;
  final Token tokenAdapter;

  @override
  Future<bool> verify() async {
    try {
      final account = await loadAccount.load();

      bool tokenIsValid = !tokenAdapter.isExpired(token: account.token);
      if (tokenIsValid) {
        return true;
      }

      bool refreshTokenIsValid = !tokenAdapter.isExpired(
        token: account.refreshToken,
      );
      if (refreshTokenIsValid) {
        return true;
      }

      return false;
    } catch (_) {
      return false;
    }
  }
}
