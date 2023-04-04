import 'package:dependencies/dependencies.dart';
import 'package:courses/courses.dart';
import '../../../domain/usecases/assessments/assessments.dart';

class RemoteLoadAttempts implements LoadAttempts {
  RemoteLoadAttempts({
    required this.client,
    required this.url,
    required this.loadAccount,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<List<AssessmentAttemptEntity>?> load() async {
    try {
      final account = await loadAccount.load();

      final response = await client.request(
        url: url,
        method: HttpMethod.get.name,
        headers: getDefaultHeaders(account.token),
      );
      return RemoteAssessmentAttemptModel.toEntityList(response.data);
    } on HttpError catch (_) {
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
