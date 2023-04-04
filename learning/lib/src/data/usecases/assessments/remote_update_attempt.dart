import 'package:dependencies/dependencies.dart';
import 'package:learning/src/data/params/params.dart';
import 'package:learning/src/domain/domain.dart';

class RemoteUpdateAttempt implements UpdateAttempt {
  RemoteUpdateAttempt({
    required this.client,
    required this.url,
    required this.loadAccount,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<void> update(
      {required List<UpdateAttemptParams> params,
      required String attemptId}) async {
    try {
      final account = await loadAccount.load();
      final endpoint = url.replaceAll('{id}', attemptId);

      await client.request(
          url: endpoint,
          method: HttpMethod.patch.name,
          headers: getDefaultHeaders(account.token),
          body: RemoteUpdateAttemptParams(params).toParams());
    } on HttpError catch (_) {
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
