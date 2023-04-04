import 'package:configuration/configuration.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks.dart';

void main() {
  setUpAll(() {
    ConfigurationManager(
      configuration: configurationMock,
    );
  });

  test('Should return a valid endpoint url', () {
    const endpoint = 'users/me';
    final url = EndPointConfiguration.url(endpoint);

    expect(url, '$prdUrl/$endpoint');
  });

  test('Should handle different endpoints standards', () {
    const endpointStandard1 = 'users/me';
    const endpointStandard2 = 'users/me/';
    const endpointStandard3 = '/users/me';
    const endpointStandard4 = '/users/me/';

    final url1 = EndPointConfiguration.url(endpointStandard1);
    final url2 = EndPointConfiguration.url(endpointStandard2);
    final url3 = EndPointConfiguration.url(endpointStandard3);
    final url4 = EndPointConfiguration.url(endpointStandard4);

    expect(url1, '$prdUrl/users/me');
    expect(url2, '$prdUrl/users/me');
    expect(url3, '$prdUrl/users/me');
    expect(url4, '$prdUrl/users/me');
  });
}
