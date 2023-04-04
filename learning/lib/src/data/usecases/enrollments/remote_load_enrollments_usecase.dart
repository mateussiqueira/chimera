import 'package:dependencies/dependencies.dart';
import 'package:learning/src/data/data.dart';
import 'package:learning/src/domain/domain.dart';

class RemoteLoadEnrollmentsUseCase implements LoadEnrollmentsUseCase {
  RemoteLoadEnrollmentsUseCase({
    required this.client,
    required this.loadAccount,
    required this.url,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<EnrollmentsEntity> load({
    required LoadEnrollmentsParams params,
  }) async {
    try {
      final account = await loadAccount.load();
      final response = await client.request(
        url: url,
        method: HttpMethod.get.name,
        headers: getDefaultHeaders(account.token),
        queryParameters:
            (params as RemoteLoadEnrollmentsParams).toQueryParameters,
      );

      return RemoteEnrollmentModel.fromJsonList(
        response.data,
        AtlasPaginationModel.fromMap(
          response.headers,
        ),
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
