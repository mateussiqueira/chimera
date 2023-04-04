import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../ui/mixins/confirm_password_input_presenter_mixin.dart';

mixin NotifierConfirmPasswordInputMixin
    implements ConfirmPasswordInputPresenterMixin {
  String? _confirmPassword;
  bool _obscureConfirmPasssword = true;
  String? _confirmPasswordErrorTxt;
  UpdatePresenter? confirmPasswordInputMixinListenable;

  void _update() {
    confirmPasswordInputMixinListenable?.update();
  }

  @override
  String? get passwordConfirm => _confirmPassword;

  @override
  void setPasswordConfirm(String? confirmPassword, String? password) {
    _confirmPassword = confirmPassword;
    if (_isConfirmPasswordValid(password)) {
      validatePasswordConfirm(password);
    } else {
      _update();
    }
  }

  @override
  bool get isPasswordConfirmObscure => _obscureConfirmPasssword;

  @override
  void setPasswordConfirmObscure(bool obscure) {
    _obscureConfirmPasssword = obscure;
    _update();
  }

  @override
  void validatePasswordConfirm(String? password) {
    _confirmPasswordErrorTxt =
        _isConfirmPasswordValid(password) || (_confirmPassword?.isEmpty ?? true)
            ? null
            : R.string.passwordAreDifferent;
    _update();
  }

  bool _isConfirmPasswordValid(String? password) =>
      (_confirmPassword?.isNotEmpty ?? false) && _confirmPassword == password;

  @override
  String? get passwordConfirmErrorText => _confirmPasswordErrorTxt;
}
