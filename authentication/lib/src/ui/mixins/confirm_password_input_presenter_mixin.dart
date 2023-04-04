mixin ConfirmPasswordInputPresenterMixin {
  String? get passwordConfirm;
  void setPasswordConfirm(String? confirmPassword, String? password);
  bool get isPasswordConfirmObscure;
  void setPasswordConfirmObscure(bool obscure);
  void validatePasswordConfirm(String? password);
  String? get passwordConfirmErrorText;
}
