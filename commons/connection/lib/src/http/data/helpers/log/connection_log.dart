import 'dart:developer';
import 'package:flutter/foundation.dart';

class ConnectionLog {
  static logRequest({
    required Uri uri,
    required String method,
    String? headers,
    String? body,
  }) {
    if (kReleaseMode) return;

    String methodName = method.toUpperCase();
    log("REQUEST $methodName ${Uri.decodeFull(uri.toString())}");
    // if (headers != null) {
    //   print(headers);
    // }
    if (body != null) {
      log(body);
    }
  }

  static logResponse(
      {String? url,
      String? method,
      int? statusCode,
      String? responseBody,
      String? responseHeaders}) {
    if (kReleaseMode) return;

    String responsePrint = "RESPONSE";
    if (statusCode != null) {
      responsePrint += " $statusCode";
    }
    if (method != null) {
      responsePrint += " FOR $method";
    }
    if (url != null) {
      responsePrint += " $url";
    }

    log(responsePrint);
    // if (responseHeaders != null) {
    //   log(responseHeaders);
    // }
    if (responseBody != null) {
      log(responseBody);
    }
  }
}
