import 'package:dependencies/dependencies.dart';
import 'package:learning/src/domain/domain.dart';
import 'package:courses/courses.dart';

class RemoteLoadContentUseCase implements LoadContentUseCase {
  RemoteLoadContentUseCase({
    required this.client,
    required this.loadAccount,
    required this.url,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<ContentEntity> load({
    required String enrollmentId,
    required String contentId,
  }) async {
    try {
      final account = await loadAccount.load();
      final response = await client.request(
        url: url
            .replaceAll('{ENROLLMENT_ID}', enrollmentId)
            .replaceAll('{CONTENT_ID}', contentId),
        method: HttpMethod.get.name,
        headers: getDefaultHeaders(account.token),
      );

      return RemoteContentModel.fromJson(response.data, const []);
    } on HttpError catch (_) {
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
