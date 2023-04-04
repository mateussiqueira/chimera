import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../ui/mixins/password_input_presenter_mixin.dart';

mixin NotifierPasswordInputMixin implements PasswordInputPresenterMixin {
  String? _password;
  bool _obscurePasssword = true;
  String? _passwordErrorTxt;
  UpdatePresenter? passwordInputMixinListenable;

  void _update() {
    passwordInputMixinListenable?.update();
  }

  @override
  String? get password => _password;

  @override
  void setPassword(String? password) {
    _password = password;
    if (isPasswordValid()) {
      validatePassword();
    } else {
      _update();
    }
  }

  @override
  bool get isPasswordObscure => _obscurePasssword;

  @override
  void setPasswordObscure(bool obscure) {
    _obscurePasssword = obscure;
    _update();
  }

  @override
  bool isPasswordValid() => (password?.length ?? 0) >= 8;

  @override
  void validatePassword() {
    _passwordErrorTxt = isPasswordValid() || (password?.isEmpty ?? true)
        ? null
        : R.string.passwordMustHave8characters;
    _update();
  }

  @override
  String? get passwordErrorText => _passwordErrorTxt;
}
