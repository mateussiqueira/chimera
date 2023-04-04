import 'package:dependencies/dependencies.dart';
import 'package:profile/src/domain/usecases/usecases.dart';

class RemoteRemoveAccount implements RemoveAccount {
  RemoteRemoveAccount({
    required this.client,
    required this.url,
    required this.loadAccount,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<bool> remove({String? text}) async {
    try {
      final account = await loadAccount.load();

      await client.request(
        url: url,
        method: HttpMethod.delete.name,
        headers: getDefaultHeaders(account.token),
        body: <String, dynamic>{
          'text': text,
        },
      );

      return true;
    } on HttpError catch (_) {
      return false;
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
