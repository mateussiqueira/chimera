import 'package:configuration/configuration.dart';

class ConfigurationManager {
  ConfigurationManager._internal(
    this._configuration,
    this._currentEnvironment,
  );

  factory ConfigurationManager({
    required Configuration configuration,
    EnvironmentType target = EnvironmentType.production,
  }) {
    return _instance = ConfigurationManager._internal(
      configuration,
      target,
    );
  }

  final Configuration _configuration;
  final EnvironmentType _currentEnvironment;

  static ConfigurationManager? _instance;

  static ConfigurationManager get _safeInstance {
    final instance = _instance;
    if (instance != null) {
      return instance;
    }
    throw Exception('Missing configuration initialization.');
  }

  static Environment get environment {
    if (_safeInstance._currentEnvironment == EnvironmentType.production) {
      return _safeInstance._configuration.environments.production;
    } else {
      return _safeInstance._configuration.environments.homologation;
    }
  }

  static Configuration get configuration => _safeInstance._configuration;

  static WebCheckoutConfiguration get webCheckout => configuration.webCheckout;

  static MenuConfiguration get menu => configuration.menu;

  static ProductConfiguration get product => configuration.product;
}
