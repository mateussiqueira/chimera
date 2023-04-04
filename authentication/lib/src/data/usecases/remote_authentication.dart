import 'package:dependencies/dependencies.dart';

import '../../domain/usecases/authentication.dart';
import '../../domain/usecases/params/params.dart';
import '../helpers/helpers.dart';
import '../models/models.dart';
import '../params/params.dart';

class RemoteAuthentication implements Authentication {
  RemoteAuthentication({required this.client, required this.url});

  final HttpClient client;
  final String url;

  @override
  Future<AccountEntity> auth({required AuthenticationParams params}) async {
    try {
      final response = await client.request(
        url: url,
        method: HttpMethod.post.name,
        body: RemoteAuthenticationParams.fromDomain(params).toJson(),
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
