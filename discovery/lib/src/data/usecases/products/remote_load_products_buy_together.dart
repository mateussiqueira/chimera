import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/domain/domain.dart';

import '../../models/models.dart';

class RemoteLoadProductsBuyTogether implements LoadProductsBuyTogether {
  RemoteLoadProductsBuyTogether({
    required this.client,
    required this.url,
  });

  final HttpClient client;
  final String url;
  @override
  Future<List<ProductEntity>> load({required String id}) async {
    try {
      final response = await client.request(
        url: url.replaceAll('{ID}', id),
        method: HttpMethod.get.name,
      );
      return List<ProductEntity>.from(
        response.data
            .map((e) => RemoteProductModel(json: e).toEntity())
            .toList(),
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
