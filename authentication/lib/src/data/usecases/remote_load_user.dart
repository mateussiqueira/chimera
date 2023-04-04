import 'package:authentication/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';

import '../models/models.dart';

class RemoteLoadUser implements LoadUser {
  RemoteLoadUser({
    required this.client,
    required this.loadAccount,
    required this.url,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<UserEntity?> load() async {
    try {
      final account = await loadAccount.load();
      final response = await client.request(
          url: url,
          method: HttpMethod.get.name,
          headers: getDefaultHeaders(account.token));
      return RemoteUserModel.fromJson(response.data).toEntity();
    } on HttpError catch (_) {
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
