mixin EmailInputPresenterMixin {
  String? get email;
  void setEmail(String? email);
  void validateEmail();
  String? get emailErrorText;
}
