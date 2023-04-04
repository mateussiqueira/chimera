import 'package:connection/connection.dart';

class HttpParameters {
  static Uri addToUrl(
    String url,
    Map<String, dynamic>? queryParameters,
  ) {
    if (queryParameters == null || queryParameters.isEmpty) {
      return Uri.parse(url);
    } else {
      queryParameters.removeNullAndEmptyParams();
      queryParameters = queryParameters.map(
        (key, value) => MapEntry(
          key,
          value is List
              ? value.map((e) => e.toString()).toList()
              : value.toString(),
        ),
      );
      return Uri.parse(url).replace(queryParameters: queryParameters);
    }
  }
}
