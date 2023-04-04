import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:learning/src/domain/domain.dart';

import '../../data.dart';

class RemoteAddAttempt implements AddAttempt {
  RemoteAddAttempt({
    required this.client,
    required this.url,
    required this.loadAccount,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<AssessmentAttemptEntity> add(
      {required AddAttemptParams params}) async {
    try {
      final account = await loadAccount.load();

      final response = await client.request(
        url: url,
        method: HttpMethod.post.name,
        headers: getDefaultHeaders(account.token),
        body: RemoteAttemptParams(id: params.id).toMap(),
      );
      return RemoteAssessmentAttemptModel(json: response.data).toEntity();
    } on HttpError catch (_) {
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
