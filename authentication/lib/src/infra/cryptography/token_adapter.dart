import 'dart:convert';

import '../../data/data.dart';

class TokenAdapter implements Token {
  @override
  Map<String, dynamic> decode({required String token}) {
    final splitToken = token.split(".");
    if (splitToken.length != 3) {
      throw const FormatException('Invalid token');
    }
    try {
      final payloadBase64 = splitToken[1];
      final normalizedPayload = base64.normalize(payloadBase64);
      final payloadString = utf8.decode(base64.decode(normalizedPayload));
      final decodedPayload = jsonDecode(payloadString);

      return decodedPayload;
    } catch (error) {
      throw const FormatException('Invalid payload');
    }
  }

  @override
  Map<String, dynamic>? tryDecode({required String token}) {
    try {
      return decode(token: token);
    } catch (error) {
      return null;
    }
  }

  @override
  bool isExpired({required String token}) {
    final expirationDate = getExpirationDate(token: token);
    return DateTime.now().isAfter(expirationDate);
  }

  @override
  DateTime getExpirationDate({required String token}) {
    final decodedToken = decode(token: token);

    final expirationDate = DateTime.fromMillisecondsSinceEpoch(0)
        .add(Duration(seconds: decodedToken['exp'].toInt()));
    return expirationDate;
  }

  @override
  Duration getTokenTime({required String token}) {
    final decodedToken = decode(token: token);

    final issuedAtDate = DateTime.fromMillisecondsSinceEpoch(0)
        .add(Duration(seconds: decodedToken["iat"]));
    return DateTime.now().difference(issuedAtDate);
  }

  @override
  Duration getRemainingTime({required String token}) {
    final expirationDate = getExpirationDate(token: token);

    return expirationDate.difference(DateTime.now());
  }

  @override
  bool isValid({required String token}) {
    // TODO: implement isValid
    throw UnimplementedError();
  }
}
