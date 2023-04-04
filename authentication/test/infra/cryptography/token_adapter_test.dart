import 'package:authentication/src/infra/cryptography/cryptography.dart';
import 'package:test/test.dart';

const token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6Ikd1c3Rhdm8iLCJpYXQiOjE1MTYyMzkwMjIsImV4cCI6NDczNDYxNTg1OH0.hh-TTBPS8z-UxdmfXWn7AwW2y_Lq3aPnlIQdqV2KEC4";
const expiredToken =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJleHAiOjE1MjYyMzkwMjJ9.GMdV0dx1F8rZuHUebeXL5tR2DROlc03IuDc2DeDTExI";
const tokenWithoutExpirationTime =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c";
const tokenWithoutIatClaim =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIn0.Gfx6VO9tcxwk6xqx9yYzSfebfeakZp5JYIgP_edcw_A";

void main() {
  late TokenAdapter sut;

  setUp(() {
    sut = TokenAdapter();
  });
  group('Decode', () {
    test("a valid token", () {
      expect(sut.decode(token: token)["name"], "Gustavo");
    });

    test("an invalid token", () {
      expect(
        () => sut.decode(token: ""),
        throwsA(isA<FormatException>()
            .having((e) => e.message, 'message', 'Invalid token')),
      );
    });

    test("an invalid payload", () {
      expect(
        () => sut.decode(token: "a.b.c"),
        throwsA(isA<FormatException>()
            .having((e) => e.message, 'message', 'Invalid payload')),
      );
    });
  });

  group('Try decode', () {
    test("a valid token", () {
      expect(sut.tryDecode(token: token)!["name"], "Gustavo");
    });

    test("an invalid token", () {
      expect(sut.tryDecode(token: ""), isNull);
    });

    test("an invalid payload", () {
      expect(sut.tryDecode(token: "a.b.c"), isNull);
    });
  });

  test("isExpired? Valid and no expired token", () {
    expect(sut.isExpired(token: token), false);
  });

  test("token without exp claim is not expired", () {
    expect(sut.isExpired(token: tokenWithoutExpirationTime), false);
  });

  test("isExpired? Valid but expired token", () {
    expect(sut.isExpired(token: expiredToken), true);
  });

  test("isExpired? Invalid token", () {
    expect(
      () => sut.isExpired(token: "lñaslksa"),
      throwsA(isA<FormatException>()
          .having((e) => e.message, 'message', 'Invalid token')),
    );
  });

  test("Expiration date", () {
    expect(sut.getExpirationDate(token: token).isAfter(DateTime.now()), true);
  });

  test("expiration date from token without exp claim is null", () {
    expect(sut.getExpirationDate(token: tokenWithoutExpirationTime), isNull);
  });

  test("Expiration date with invalid token", () {
    expect(
      () => sut.getExpirationDate(token: "an.invalid.payload"),
      throwsA(isA<FormatException>()
          .having((e) => e.message, 'message', 'Invalid payload')),
    );
  });

  test("Expiration time", () {
    expect(sut.getTokenTime(token: token).inDays, greaterThan(1));
  });

  test("token time from token without iat claim is null", () {
    expect(sut.getTokenTime(token: tokenWithoutIatClaim), isNull);
  });

  test("Expiration time with invalid token", () {
    expect(
      () => sut.getTokenTime(token: "invalid.token"),
      throwsA(isA<FormatException>()
          .having((e) => e.message, 'message', 'Invalid token')),
    );
  });

  test("Remaining time from now", () {
    expect(sut.getRemainingTime(token: token).inSeconds, greaterThan(0));
  });

  test("remaining time from token without exp claim is null", () {
    expect(sut.getRemainingTime(token: token).inSeconds, greaterThan(0));
  });
}
