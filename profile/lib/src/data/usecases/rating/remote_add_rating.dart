import 'package:dependencies/dependencies.dart';
import 'package:profile/src/domain/params/rating/add_rating_params.dart';
import 'package:profile/src/domain/usecases/rating/add_rating.dart';

import '../../params/params.dart';

class RemoteAddRating implements AddRating {
  RemoteAddRating({
    required this.client,
    required this.url,
    required this.loadAccount,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<void> add(AddRatingParams params) async {
    try {
      final account = await loadAccount.load();

      await client.request(
        url: url,
        method: HttpMethod.post.name,
        headers: getDefaultHeaders(account.token),
        body: RemoteAddRatingParams(params: params).toParams(),
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
