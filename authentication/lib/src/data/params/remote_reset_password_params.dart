class RemoteResetPasswordParams {
  final String code;
  final String email;
  final String password;

  RemoteResetPasswordParams({
    required this.code,
    required this.email,
    required this.password,
  });
}
