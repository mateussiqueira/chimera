import 'package:dependencies/dependencies.dart';
import 'package:learning/src/data/data.dart';
import 'package:learning/src/domain/domain.dart';

class RemoteLoadEnrollmentUseCase implements LoadEnrollmentUseCase {
  RemoteLoadEnrollmentUseCase({
    required this.client,
    required this.loadAccount,
    required this.url,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<EnrollmentEntity> load({required String id}) async {
    try {
      final account = await loadAccount.load();
      final response = await client.request(
        url: url.replaceAll('{ENROLLMENT_ID}', id),
        method: HttpMethod.get.name,
        headers: getDefaultHeaders(account.token),
      );

      return RemoteEnrollmentModel.fromJson(response.data);
    } on HttpError catch (_) {
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
