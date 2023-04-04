import 'package:authentication/src/ui/helpers/extensions/extensions.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../ui/mixins/email_input_presenter_mixin.dart';

mixin NotifierEmailInputMixin implements EmailInputPresenterMixin {
  String? _email;
  String? _emailErrorTxt;
  UpdatePresenter? emailInputMixinListenable;

  void _update() {
    emailInputMixinListenable?.update();
  }

  @override
  String? get email => _email;

  @override
  void setEmail(String? email) {
    _email = email;
    if (isEmailValid()) {
      validateEmail();
    } else {
      _update();
    }
  }

  bool isEmailValid() => email?.isValidEmail() ?? false;

  @override
  void validateEmail() {
    _emailErrorTxt = isEmailValid() || (email?.trim().isEmpty ?? true)
        ? null
        : R.string.invalidEmail;
    _update();
  }

  @override
  String? get emailErrorText => _emailErrorTxt;
}
