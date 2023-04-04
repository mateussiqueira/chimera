import 'package:configuration/src/infra/defaults/defaults.dart';

import 'environment.dart';

class Environments {
  const Environments({
    required this.production,
    this.homologation = DefaultConfiguration.environmentHml,
  });

  final Environment production;
  final Environment homologation;
}
