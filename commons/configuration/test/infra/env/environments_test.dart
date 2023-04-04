import 'package:configuration/configuration.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks.dart';

void main() {
  test('Should throw a exception without configure Environments', () {
    expect(() => ConfigurationManager.environment, throwsException);
  });

  test('Should return a correct environment (prd)', () {
    ConfigurationManager(
      configuration: configurationMock,
    );

    expect(ConfigurationManager.environment, prdEnv);
  });

  test('Should return a correct environment (hml)', () {
    ConfigurationManager(
      configuration: fullConfigurationMock,
      target: EnvironmentType.homologation,
    );

    expect(ConfigurationManager.environment, hmlEnv);
  });
}
