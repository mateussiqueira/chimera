import 'package:authentication/src/data/data.dart';
import 'package:authentication/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';

class RemoteResetPasswordValidateCode implements ResetPasswordValidateCode {
  RemoteResetPasswordValidateCode({
    required this.httpClient,
    required this.url,
  });

  final HttpClient httpClient;
  final String url;

  @override
  Future<bool> validateCode({
    required String email,
    required String code,
  }) async {
    try {
      final response = await httpClient.request(
        url: url,
        method: HttpMethod.post.name,
        body: {
          "email": email,
          "code": code,
        },
      );

      return response.data["valid"];
    } on HttpError catch (error) {
      if (error is BusinessError) {
        throw ResetInvalidCodeError();
      }
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
