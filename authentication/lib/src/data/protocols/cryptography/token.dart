abstract class Token {
  Map<String, dynamic> decode({required String token});
  bool isValid({required String token});
  Map<String, dynamic>? tryDecode({required String token});
  bool isExpired({required String token});
  DateTime getExpirationDate({required String token});
  Duration getTokenTime({required String token});
  Duration getRemainingTime({required String token});
}
