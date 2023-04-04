import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:profile/src/domain/domain.dart';
import 'package:profile/src/ui/ui.dart';
import 'package:certificates/certificates.dart';

class NotifierMyCertificatesPresenter extends ChangeNotifier
    implements MyCertificatesPresenter {
  NotifierMyCertificatesPresenter({
    required this.loadCertificates,
  }) {
    load();
  }

  final LoadCertificates loadCertificates;

  void _update() => notifyListeners();

  List<CertificateEntity> _certificates = [];
  CertificatesStatus _hasCertificates = CertificatesStatus.noLoad;

  @override
  Future<void> load() async {
    try {
      LoadingWidget.show();
      final future = await loadCertificates.load();

      _certificates = future;
      if (_certificates.isNotEmpty) {
        _hasCertificates = CertificatesStatus.hasCertificates;
      } else {
        _hasCertificates = CertificatesStatus.empty;
      }
    } on DomainError catch (e) {
      ToastWidget.showError(message: e.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } catch (_) {
      ToastWidget.showGenericError();
    }
    LoadingWidget.hide();
    _update();
  }

  @override
  Future<void> nextPage() async {
    // TODO fazer paginação
  }

  @override
  List<CertificateEntity> get certificates => _certificates;

  @override
  CertificatesStatus get hasCertificates => _hasCertificates;
}
