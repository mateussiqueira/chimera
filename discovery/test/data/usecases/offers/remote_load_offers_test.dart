import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/data/data.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late RemoteLoadOffers sut;
  late HttpClientSpy httpClient;
  late String url;

  late String id;

  List<Map<String, dynamic>> mockValidData() => [
        {
          "id": "string",
          "slug": "string",
          "name": "string",
          "price": {"cents": 0, "currency_iso": "BRL"},
          "reference_price": {"cents": 0, "currency_iso": "BRL"},
          "items": [
            {
              "id": "string",
              "name": "string",
              "price": {"cents": 0, "currency_iso": "BRL"},
              "reference_price": {"cents": 0, "currency_iso": "BRL"},
              "product": {
                "id": "string",
                "slug": "string",
                "name": "string",
                "sku": "string",
                "productable_id": "string",
                "categories": [
                  {
                    "id": "string",
                    "name": "string",
                    "slug": "string",
                    "description": "string",
                    "media": {"card_image": "string"},
                    "info": {
                      "course_count": 0,
                      "enrollment_count": 0,
                      "user_count": 0
                    }
                  }
                ],
                "available_offers": [null],
                "description": "string",
                "media": {"card_image": "string"}
              }
            }
          ],
          "max_installments": {
            "times": 0,
            "total": {"cents": 0, "currency_iso": "BRL"}
          },
          "media": {"card_image": "string"}
        }
      ];

  final offers = RemoteLoadOffersModel.fromJson(mockValidData()).toListEntity();

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();

    id = faker.guid.guid();

    sut = RemoteLoadOffers(
      client: httpClient,
      url: url,
    );

    httpClient.mockRequest(mockValidData());
  });

  test('Should call Load with correct values', () async {
    await sut.load(id);

    verify(
      () => httpClient.request(
        url: url,
        method: HttpMethod.get.name,
        queryParameters: {
          "filter": {
            "id": id,
          }
        },
      ),
    );
  });
  test('Should throw UnexpectedError if Load fail', () async {
    httpClient.mockRequestError(
      BusinessError(
        statusCode: 422,
        code: 'XX',
        message: 'NotFound',
      ),
    );

    final future = sut.load(id);

    expect(future, throwsA(const TypeMatcher<UnexpectedError>()));
  });

  test('Should throw NoInternetError if user do not have internet', () async {
    httpClient.mockRequestError(NoInternetError());

    final future = sut.load(id);

    expect(future, throwsA(const TypeMatcher<NoInternetError>()));
  });

  test('Should return Offers if Load success', () async {
    final future = await sut.load(id);

    expect(offers, future);
  });
}
