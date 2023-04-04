import 'dart:io';

Map<String, String> getDefaultHeaders(String? token) {
  if (token != null && token.isNotEmpty) {
    return {
      HttpHeaders.authorizationHeader: getBearerToken(token),
    };
  }
  return {};
}

String getBearerToken(String token) => "Bearer $token";
