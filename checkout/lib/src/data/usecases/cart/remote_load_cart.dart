import 'package:checkout/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';

import '../../data.dart';

class RemoteLoadCart implements LoadCart {
  RemoteLoadCart({
    required this.client,
    required this.url,
    required this.loadAccount,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<CartEntity> load() async {
    try {
      final account = await loadAccount.load();

      final response = await client.request(
        url: url,
        method: HttpMethod.get.name,
        headers: getDefaultHeaders(account.token),
      );

      final data = Map<String, dynamic>.from(response.data);

      return RemoteCartModel.fromJson(data).toEntity();
    } on HttpError catch (_) {
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
