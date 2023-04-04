import 'package:checkout/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';

import '../../data.dart';

class RemoteUpdateCart implements UpdateCart {
  RemoteUpdateCart({
    required this.client,
    required this.url,
    required this.loadAccount,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<CartEntity> update({required List<String> offerIds}) async {
    try {
      final account = await loadAccount.load();

      final response = await client.request(
        url: url,
        method: HttpMethod.put.name,
        headers: getDefaultHeaders(account.token),
        body: {
          "offers": [
            ...offerIds.toSet().toList().map((id) => {"id": id})
          ],
        },
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
