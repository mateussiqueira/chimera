import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../domain/domain.dart';
import '../../ui/pages/reset_password/reset_password.dart';
import '../mixins/notifier_confirm_password_mixin.dart';
import '../mixins/notifier_password_input_mixin.dart';

class NotifierResetPasswordConfirmPresenter extends NotifierUpdatePresenter
    with NotifierPasswordInputMixin, NotifierConfirmPasswordInputMixin
    implements ResetPasswordConfirmPresenter {
  NotifierResetPasswordConfirmPresenter({required this.remoteResetPassword}) {
    passwordInputMixinListenable = this;
    confirmPasswordInputMixinListenable = this;
  }

  final ResetPasswordConfirm remoteResetPassword;

  @override
  bool get isFormValidated =>
      (password?.length ?? 0) >= 8 && password == passwordConfirm;

  @override
  Future<bool> confirm(String email, String code, BuildContext context) async {
    if (!isFormValidated) {
      return false;
    }
    bool success = false;
    try {
      LoadingWidget.show();
      success = await remoteResetPassword.confirm(
          email: email, code: code, password: password ?? '');
      if (!success) {
        ToastWidget.showGenericError();
      }
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } catch (_) {
      ToastWidget.showGenericError();
    }
    LoadingWidget.hide();
    return success;
  }
}
