import 'package:configuration/configuration.dart';
import 'package:iterable/iterable_secrets.dart';

class DefaultConfiguration {
  static const Environment environmentHml = Environment(
    baseUrl: 'https://atlas.qcarreiras-hmg.com',
    iterableApiKey: IterableSecrets.apiKeyStaging,
  );
}
