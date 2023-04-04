import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../data/data.dart';
import '../../domain/usecases/reset_password_ask.dart';
import '../../ui/pages/reset_password/reset_password.dart';
import '../mixins/notifier_email_input_mixin.dart';

class NotifierResetPasswordAskPresenter extends NotifierUpdatePresenter
    with NotifierEmailInputMixin
    implements ResetPasswordAskPresenter {
  NotifierResetPasswordAskPresenter({required this.remoteResetPassword}) {
    emailInputMixinListenable = this;
  }

  final ResetPasswordAsk remoteResetPassword;

  @override
  bool get isFormValidated => isEmailValid();

  @override
  Future<bool> ask(BuildContext context) async {
    if (!isFormValidated) {
      return false;
    }
    bool success = false;
    try {
      LoadingWidget.show();
      success = await remoteResetPassword.ask(email: email ?? '');
      if (!success) {
        ToastWidget.showGenericError();
      }
    } on ResetNonRegisteredError catch (e) {
      ToastWidget.showError(message: e.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } catch (_) {
      ToastWidget.showGenericError();
    }
    LoadingWidget.hide();
    return success;
  }
}
