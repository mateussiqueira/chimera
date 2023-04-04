import 'package:configuration/configuration.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks.dart';

void main() {
  test('Should throw a exception without configure MenuConfiguration', () {
    expect(() => ConfigurationManager.menu, throwsException);
  });

  test('Should return a correct menu url', () {
    ConfigurationManager(
      configuration: configurationMock,
    );

    expect(ConfigurationManager.menu.helpCenter, helpCenterUrl);
    expect(ConfigurationManager.menu.privacyPolicy, privacyPolicyUrl);
    expect(ConfigurationManager.menu.userTerms, userTermsUrl);
  });
}
