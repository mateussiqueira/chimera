import 'package:dependencies/dependencies.dart';
import 'package:learning/src/data/params/params.dart';
import 'package:learning/src/domain/domain.dart';

class RemoteSaveEnrollmentProgress implements SaveEnrollmentProgress {
  RemoteSaveEnrollmentProgress({
    required this.client,
    required this.loadAccount,
    required this.url,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<void> save({
    required String enrollmentId,
    required String contentId,
  }) async {
    try {
      final account = await loadAccount.load();
      await client.request(
        url: url.replaceAll('{ENROLLMENT_ID}', enrollmentId),
        method: HttpMethod.post.name,
        headers: getDefaultHeaders(account.token),
        body: RemoteSaveProgressParams(id: contentId).toBodyJson,
      );
    } on HttpError catch (_) {
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
