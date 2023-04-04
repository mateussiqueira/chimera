import 'package:dependencies/dependencies.dart';
import 'package:learning/src/domain/domain.dart';

import '../../data.dart';

class RemoteSaveEnrollmentRating implements SaveEnrollmentRating {
  RemoteSaveEnrollmentRating({
    required this.client,
    required this.loadAccount,
    required this.url,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<void> save({required RemoteRatingModel rating}) async {
    try {
      final account = await loadAccount.load();
      await client.request(
        url: url.replaceAll('{ENROLLMENT_ID}', rating.reference ?? ''),
        method: HttpMethod.post.name,
        headers: getDefaultHeaders(account.token),
        body: rating.toMap(),
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
