import 'package:authentication/src/data/data.dart';
import 'package:authentication/src/domain/domain.dart';
import 'package:authentication/src/infra/infra.dart';
import 'package:dependencies/dependencies.dart';

class RemoteSocialAuthentication implements SocialAuthentication {
  RemoteSocialAuthentication({
    required this.client,
  });

  final HttpClient client;

  @override
  Future<AccountEntity> auth(SocialCredentialsEntity credentials) async {
    try {
      late String url;

      switch (credentials.provider) {
        case SocialProvider.apple:
          url = EndPointConfiguration.url(Endpoint.loginApple.endPoint);
          break;
        case SocialProvider.facebook:
          url = EndPointConfiguration.url(Endpoint.loginFacebook.endPoint);
          break;
        case SocialProvider.google:
          url = EndPointConfiguration.url(Endpoint.loginGoogle.endPoint);
          break;
      }

      final response = await client.request(
        url: url,
        method: HttpMethod.post.name,
        body: RemoteSocialAuthenticationParams.fromCredentials(credentials)
            .toJson(),
      );
      return RemoteAccountModel.fromJson(response.data).toEntity();
    } on HttpError catch (error) {
      if (error is BusinessError) {
        throw InvalidCredentialsError();
      }
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
