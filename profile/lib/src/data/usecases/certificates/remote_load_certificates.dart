import 'package:dependencies/dependencies.dart';
import 'package:profile/src/domain/domain.dart';
import 'package:certificates/certificates.dart';

import '../../models/models.dart';

class RemoteLoadCertificates implements LoadCertificates {
  RemoteLoadCertificates({
    required this.client,
    required this.url,
    required this.loadAccount,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<List<CertificateEntity>> load() async {
    try {
      final account = await loadAccount.load();

      final response = await client.request(
        url: url,
        method: HttpMethod.get.name,
        headers: getDefaultHeaders(account.token),
      );

      final data = response.data;

      return RemoteLoadCertificatesModel.fromJson(data).toListEntity();
    } on HttpError catch (_) {
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
