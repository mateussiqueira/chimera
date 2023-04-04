import 'package:dependencies/dependencies.dart';
import 'package:courses/courses.dart';
import '../../../domain/usecases/assessments/assessments.dart';

class RemoteCompleteAttempt implements CompleteAttempt {
  RemoteCompleteAttempt({
    required this.client,
    required this.url,
    required this.loadAccount,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<AssessmentAttemptEntity> complete({required String attemptId}) async {
    try {
      final account = await loadAccount.load();

      final endpoint = url.replaceAll('{id}', attemptId);

      final response = await client.request(
        url: endpoint,
        method: HttpMethod.post.name,
        headers: getDefaultHeaders(account.token),
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
