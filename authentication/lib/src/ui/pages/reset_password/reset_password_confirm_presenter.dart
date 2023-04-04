import 'package:authentication/src/ui/mixins/confirm_password_input_presenter_mixin.dart';
import 'package:authentication/src/ui/mixins/password_input_presenter_mixin.dart';
import 'package:design_system/design_system.dart';

import '../../mixins/form_validation_presenter_mixin.dart';

abstract class ResetPasswordConfirmPresenter extends UpdatePresenter
    with
        PasswordInputPresenterMixin,
        ConfirmPasswordInputPresenterMixin,
        FormValidationPresenterMixin {
  Future<bool> confirm(String email, String code, BuildContext context);
}
