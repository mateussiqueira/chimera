import 'package:authentication/src/presentation/mixins/notifier_email_input_mixin.dart';
import 'package:authentication/src/presentation/mixins/notifier_login_social_buttons_mixin.dart';
import 'package:authentication/src/presentation/mixins/notifier_password_input_mixin.dart';
import 'package:authentication/src/ui/ui.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../data/data.dart';
import '../../domain/domain.dart';

class NotifierLoginPresenter extends NotifierUpdatePresenter
    with
        NotifierEmailInputMixin,
        NotifierPasswordInputMixin,
        NotifierLoginSocialButtonMixin
    implements LoginPresenter {
  NotifierLoginPresenter({
    required this.remoteAuthentication,
    required this.remoteInitUser,
    required this.localSaveAccount,
    required this.googleAuthentication,
    required this.appleAuthentication,
    required this.remoteSocialAuthentication,
  }) {
    emailInputMixinListenable = this;
    passwordInputMixinListenable = this;
  }

  final Authentication remoteAuthentication;

  @override
  bool get isFormValidated => isEmailValid() && isPasswordValid();

  @override
  void clearFields() {
    setEmail(null);
    setPassword(null);
  }

  @override
  Future<bool> doLogin(BuildContext context) async {
    if (!isFormValidated) {
      return false;
    }
    bool success = false;
    try {
      LoadingWidget.show();
      final account = await remoteAuthentication.auth(
        params: AuthenticationParams(
          email: email ?? '',
          password: password ?? '',
        ),
      );
      await remoteInitUser.initUser(account: account);
      clearFields();
      success = true;
      Marcopolo().emit(UserLoggedInEvent());
    } on InvalidCredentialsError catch (e) {
      ToastWidget.showError(message: e.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } catch (_) {
      ToastWidget.showGenericError();
    }
    LoadingWidget.hide();
    return success;
  }

  @override
  SocialAuthenticationAdapter googleAuthentication;

  @override
  SocialAuthentication remoteSocialAuthentication;

  @override
  SaveAccount localSaveAccount;

  @override
  SocialAuthenticationAdapter appleAuthentication;

  @override
  InitUser remoteInitUser;
}
