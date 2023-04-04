import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/data/params/params.dart';
import 'package:discovery/src/domain/domain.dart';

import '../../models/models.dart';

class RemoteLoadProductsUsersBought implements LoadProductsUsersBought {
  RemoteLoadProductsUsersBought({
    required this.client,
    required this.url,
  });

  final HttpClient client;
  final String url;
  @override
  Future<ProductsEntity> load(String id, LoadProductsParams params) async {
    try {
      final response = await client.request(
        url: url.replaceAll('{ID}', id),
        method: HttpMethod.get.name,
        queryParameters: (params as RemoteLoadProductsParams).toQueryParameters,
      );

      return RemoteLoadProductsModel.fromJsonList(
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
