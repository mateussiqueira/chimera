import 'package:dependencies/dependencies.dart';

import '../../domain/usecases/reset_password_confirm.dart';

class RemoteResetPasswordConfirm implements ResetPasswordConfirm {
  RemoteResetPasswordConfirm({
    required this.httpClient,
    required this.url,
  });

  final HttpClient httpClient;
  final String url;

  @override
  Future<bool> confirm({
    required String email,
    required String code,
    required String password,
  }) async {
    try {
      final response = await httpClient.request(
        url: url,
        method: HttpMethod.post.name,
        body: {"email": email, "password": password, "code": code},
      );

      return response.data["changed"];
    } on HttpError catch (_) {
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
