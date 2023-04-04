import 'package:authentication/src/data/data.dart';
import 'package:authentication/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';

class RemoteResetPasswordAsk implements ResetPasswordAsk {
  RemoteResetPasswordAsk({
    required this.httpClient,
    required this.url,
  });

  final HttpClient httpClient;
  final String url;

  @override
  Future<bool> ask({required String email}) async {
    try {
      final response = await httpClient.request(
        url: url,
        method: HttpMethod.post.name,
        body: {"email": email},
      );

      return response.data["sent"];
    } on HttpError catch (error) {
      if (error is BusinessError) {
        throw ResetNonRegisteredError();
      }
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
