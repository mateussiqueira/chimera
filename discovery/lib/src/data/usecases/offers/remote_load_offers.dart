import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/domain/domain.dart';

import '../../models/offers/offers.dart';

class RemoteLoadOffers implements LoadOffers {
  RemoteLoadOffers({
    required this.client,
    required this.url,
  });

  final HttpClient client;
  final String url;
  @override
  Future<List<OffersEntity>> load(String id) async {
    try {
      final response = await client.request(
        url: url,
        method: HttpMethod.get.name,
        queryParameters: {
          "filter": {
            "id": id,
          }
        },
      );
      return RemoteLoadOffersModel.fromJson(response.data).toListEntity();
    } on HttpError catch (_) {
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
