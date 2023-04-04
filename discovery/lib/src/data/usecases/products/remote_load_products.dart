import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/data/params/products/remote_load_products_params.dart';
import 'package:discovery/src/domain/domain.dart';

import '../../models/models.dart';

class RemoteLoadProducts implements LoadProducts {
  RemoteLoadProducts({
    required this.client,
    required this.url,
  });

  final HttpClient client;
  final String url;

  @override
  Future<ProductsEntity> load(LoadProductsParams params) async {
    try {
      final response = await client.request(
        url: url,
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
