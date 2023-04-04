import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:profile/src/domain/usecases/usecases.dart';
import 'package:profile/src/ui/pages/account_deletion/account_deletion.dart';

class NotifierAccountDeletionPresenter extends NotifierUpdatePresenter
    implements AccountDeletionPresenter {
  NotifierAccountDeletionPresenter({
    required this.removeAccount,
  });

  final RemoveAccount removeAccount;

  String? _text;

  @override
  Future<bool> delete() async {
    try {
      LoadingWidget.show();
      final removed = await removeAccount.remove(text: _text);
      if (removed) {
        Marcopolo().emit(DoLogoutEvent());
        return true;
      } else {
        ToastWidget.showGenericError();
        return false;
      }
    } on DomainError catch (e) {
      ToastWidget.showError(message: e.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } catch (_) {
      ToastWidget.showGenericError();
    }
    LoadingWidget.hide();
    return false;
  }

  @override
  set text(String text) => _text = text;
}
