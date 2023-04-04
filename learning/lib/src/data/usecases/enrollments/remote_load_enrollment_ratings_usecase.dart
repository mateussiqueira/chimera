import 'package:dependencies/dependencies.dart';
import 'package:learning/src/domain/domain.dart';

import '../../data.dart';

class RemoteLoadEnrollmentRatings implements LoadEnrollmentRatings {
  RemoteLoadEnrollmentRatings({
    required this.client,
    required this.loadAccount,
    required this.url,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<List<RemoteRatingModel>?> load({
    required RemoteRatingModel params,
  }) async {
    try {
      final account = await loadAccount.load();
      final response = await client.request(
        url: url,
        queryParameters: {
          'filter[kind]': params.rateKind?.apiText,
          'filter[reference]': params.reference,
        },
        method: HttpMethod.get.name,
        headers: getDefaultHeaders(account.token),
      );

      return RemoteRatingModel.toEntityList(response.data);
    } on HttpError catch (_) {
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
