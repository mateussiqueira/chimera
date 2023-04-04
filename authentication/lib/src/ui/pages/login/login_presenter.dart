import 'package:authentication/src/ui/mixins/email_input_presenter_mixin.dart';
import 'package:authentication/src/ui/mixins/form_validation_presenter_mixin.dart';
import 'package:authentication/src/ui/mixins/login_social_buttons_mixin.dart';
import 'package:authentication/src/ui/mixins/password_input_presenter_mixin.dart';
import 'package:design_system/design_system.dart';

abstract class LoginPresenter extends UpdatePresenter
    with
        EmailInputPresenterMixin,
        PasswordInputPresenterMixin,
        FormValidationPresenterMixin,
        LoginSocialButtonsMixin {
  void clearFields();
  Future<bool> doLogin(BuildContext context);
}
