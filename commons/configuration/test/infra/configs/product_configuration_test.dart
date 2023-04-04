import 'package:configuration/configuration.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks.dart';

void main() {
  test('Should throw a exception without configure ProductConfiguration', () {
    expect(() => ConfigurationManager.product, throwsException);
  });

  test('Should return a correct web checkout url', () {
    ConfigurationManager(
      configuration: configurationMock,
    );

    final url = ConfigurationManager.product.url(slug: 'product');

    expect(url, "$productUrl/product");
  });
}
