import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../../ui/pages/checkout/checkout.dart';

class NotifierCheckoutPresenter extends ChangeNotifier
    implements CheckoutPresenter {
  NotifierCheckoutPresenter({
    required this.loadAccount,
    required this.httpClient,
    required this.shareContent,
  }) {
    configureUrl();
  }

  final LoadAccount loadAccount;
  final HttpClient httpClient;
  final ShareContent shareContent;

  void _update() => notifyListeners();
  String _url = '';

  @override
  Future<void> configureUrl() async {
    try {
      final future = await loadAccount.load();

      final token = future.token;
      final refresh = future.refreshToken;

      _url = ConfigurationManager.webCheckout.url(
        jwtToken: token,
        refreshToken: refresh,
      );

      _update();
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }
  }

  @override
  String get url => _url;

  @override
  Future<void> download(String url) async {
    try {
      LoadingWidget.show();

      final bytes = await httpClient.download(url: url);
      await shareContent.shareBytes(bytes, 'boleto.pdf');
    } on DomainError catch (e) {
      ToastWidget.showError(message: e.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } catch (_) {
      ToastWidget.showGenericError();
    }
    LoadingWidget.hide();
  }
}
