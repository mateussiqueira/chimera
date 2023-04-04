import 'package:configuration/configuration.dart';

const prdUrl = 'https://example.com';
const hmlUrl = 'https://hml.example.com';
const checkoutUrl = 'https://example.com/checkout';
const redirectTarget = 'credit-card';
const privacyPolicyUrl = 'https://example.com/privacy-policy';
const userTermsUrl = 'https://example.com/user-terms';
const helpCenterUrl = 'https://example.com/help-center';
const jwtToken = 'eeeeeeee';
const refreshToken = 'aaaaaaaa';
const webCheckoutUrlMock =
    'https://example.com/checkout?token=$jwtToken&refreshToken=$refreshToken&redirectUrl=$redirectTarget';
const productUrl = 'https://example.com/p/';

const prdEnv = Environment(baseUrl: prdUrl);
const hmlEnv = Environment(baseUrl: hmlUrl);

const checkoutConf = WebCheckoutConfiguration(
  entryPoint: checkoutUrl,
  redirectTo: redirectTarget,
);

const menuConf = MenuConfiguration(
  privacyPolicy: privacyPolicyUrl,
  userTerms: userTermsUrl,
  helpCenter: helpCenterUrl,
);

const productConf = ProductConfiguration(productUrl: productUrl);

const fullConfigurationMock = Configuration(
  environments: Environments(
    production: prdEnv,
    homologation: hmlEnv,
  ),
  webCheckout: checkoutConf,
  menu: menuConf,
  product: productConf,
);

const configurationMock = Configuration(
  environments: Environments(
    production: prdEnv,
  ),
  webCheckout: checkoutConf,
  menu: menuConf,
  product: productConf,
);
