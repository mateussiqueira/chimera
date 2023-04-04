import 'package:configuration/configuration.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks.dart';

void main() {
  test('Should throw a exception without configure WebCheckout', () {
    expect(() => ConfigurationManager.webCheckout, throwsException);
  });

  test('Should return a correct web checkout url', () {
    ConfigurationManager(
      configuration: configurationMock,
    );

    expect(
        ConfigurationManager.webCheckout
            .url(jwtToken: jwtToken, refreshToken: refreshToken),
        webCheckoutUrlMock);
  });
}
