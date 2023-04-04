import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/domain/domain.dart';

import '../../models/models.dart';

class RemoteLoadProduct implements LoadProduct {
  RemoteLoadProduct({
    required this.client,
    required this.url,
  });

  final HttpClient client;
  final String url;

  @override
  Future<ProductEntity> load({required String slug}) async {
    try {
      final response = await client.request(
        url: url.replaceAll('{SLUG}', slug),
        method: HttpMethod.get.name,
      );

      return RemoteProductModel(json: response.data).toEntity();
    } on HttpError catch (_) {
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
