import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/domain/domain.dart';

import '../../models/models.dart';

class RemoteLoadCategories implements LoadCategories {
  RemoteLoadCategories({
    required this.client,
    required this.url,
  });

  final HttpClient client;
  final String url;
  @override
  Future<List<CategoryEntity>> load() async {
    try {
      final response = await client.request(
        url: url,
        method: HttpMethod.get.name,
        queryParameters: {
          'filter[with_products]': true,
        },
      );
      return RemoteLoadCategoriesModel.fromJson(response.data).toListEntity();
    } on HttpError catch (_) {
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
