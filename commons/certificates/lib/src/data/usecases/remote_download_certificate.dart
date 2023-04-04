import 'package:dependencies/dependencies.dart';

import '../../../certificates.dart';

class RemoteDownloadCertificate implements DownloadCertificate {
  RemoteDownloadCertificate({
    required this.client,
    required this.url,
    required this.loadAccount,
  });

  final HttpClient client;
  final String url;
  final LoadAccount loadAccount;

  @override
  Future<String> download({
    required String id,
    required CertificateFileType type,
  }) async {
    try {
      final account = await loadAccount.load();

      final endpoint = url.replaceAll('{ID}', id);

      final response = await client.request(
        url: endpoint,
        method: HttpMethod.post.name,
        headers: getDefaultHeaders(account.token),
        body: {"type": type.apiText},
      );

      final data = response.data;

      return RemoteDownloadCertificateModel.fromJson(data).toEntity();
    } on HttpError catch (_) {
      throw UnexpectedError();
    } on NoInternetError {
      rethrow;
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
