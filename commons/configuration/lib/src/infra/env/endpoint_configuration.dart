import 'package:configuration/configuration.dart';

class EndPointConfiguration {
  static String url(String endpoint, {String? baseUrl}) {
    baseUrl = baseUrl ?? ConfigurationManager.environment.baseUrl;
    return _normalizeString('${Uri.parse(baseUrl).replace(path: endpoint)}');
  }

  static String _normalizeString(String url) {
    final decodedUrl = Uri.decodeFull(url);
    if (decodedUrl.endsWith('/')) {
      return decodedUrl.substring(0, decodedUrl.length - 1);
    }
    return decodedUrl;
  }
}
