import 'package:dependencies/dependencies.dart';

import '../../domain/domain.dart';
import '../models/models.dart';

class RemoteRefreshToken implements RefreshToken {
  RemoteRefreshToken({
    required this.httpClient,
    required this.initUser,
    required this.localLoadAccount,
    required this.url,
  });

  final HttpClient httpClient;
  final InitUser initUser;
  final LoadAccount localLoadAccount;
  final String url;

  @override
  Future<String> refresh() async {
    try {
      final account = await localLoadAccount.load();

      final response = await httpClient.request(
        url: url,
        method: HttpMethod.post.name,
        body: {
          "token": account.refreshToken,
        },
      );

      final newAccount = RemoteAccountModel.fromJson(response.data).toEntity();
      await initUser.initUser(account: newAccount);

      return newAccount.token;
    } on HttpError catch (_) {
      rethrow;
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
