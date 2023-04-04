import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../certificates.dart';

class NotifierDownloadCertificatePresenter extends NotifierUpdatePresenter
    implements DownloadCertificatePresenter {
  NotifierDownloadCertificatePresenter({
    required this.downloadCertificate,
    required this.httpClient,
    required this.shareContent,
  });

  CertificateEntity? _certificate;
  final DownloadCertificate downloadCertificate;
  final HttpClient httpClient;
  final ShareContent shareContent;

  @override
  Future<void> initCertificate(
    CertificateEntity certificate,
  ) async {
    _certificate = certificate;
  }

  @override
  Future<void> download(
    CertificateFileType type,
  ) async {
    try {
      LoadingWidget.show();
      final url = await downloadCertificate.download(
        id: _certificate?.id ?? '',
        type: type,
      );
      final bytes = await httpClient.download(url: url);
      await shareContent.shareBytes(bytes, _fileName(type));
    } on DomainError catch (e) {
      ToastWidget.showError(message: e.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } catch (_) {
      ToastWidget.showGenericError();
    }
    LoadingWidget.hide();
  }

  String _fileName(CertificateFileType type) {
    return '${R.string.certificate}_${_certificate?.courseName?.replaceAll(' ', '_') ?? ''}${type.fileExtension}';
  }
}
