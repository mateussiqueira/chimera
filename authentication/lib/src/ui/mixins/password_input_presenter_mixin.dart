mixin PasswordInputPresenterMixin {
  String? get password;
  void setPassword(String? password);
  bool get isPasswordObscure;
  void setPasswordObscure(bool obscure);
  bool isPasswordValid();
  void validatePassword();
  String? get passwordErrorText;
}
