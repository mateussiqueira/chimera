import 'package:authentication/src/data/helpers/already_exists_account.dart';
import 'package:dependencies/dependencies.dart';

import '../../domain/domain.dart';
import '../models/models.dart';
import '../params/params.dart';

class RemoteAddAccount implements AddAccount {
  RemoteAddAccount({
    required this.httpClient,
    required this.url,
  });

  final HttpClient httpClient;
  final String url;

  @override
  Future<AccountEntity> add(AddAccountParams params) async {
    try {
      final response = await httpClient.request(
        url: url,
        method: HttpMethod.post.name,
        body: RemoteAddAccountParams.fromDomain(params).toJson(),
      );
      return RemoteAccountModel.fromJson(response.data).toEntity();
    } on HttpError catch (error) {
      if (error is BusinessError) {
        throw AlreadyExistsAccountError();
      }
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
