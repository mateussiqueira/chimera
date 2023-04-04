import 'package:configuration/configuration.dart';

class Configuration {
  const Configuration({
    required this.environments,
    required this.webCheckout,
    required this.menu,
    required this.product,
  });

  final Environments environments;
  final WebCheckoutConfiguration webCheckout;
  final MenuConfiguration menu;
  final ProductConfiguration product;
}
