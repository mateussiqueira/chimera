enum Endpoint {
  login('auth/login'),
  loginApple('auth/apple'),
  loginFacebook('auth/facebook'),
  loginGoogle('auth/google'),
  myUser('/users/me'),
  refreshToken('auth/refresh'),
  registerUser('auth/register'),
  resetPasswordAsk('auth/reset_password/ask'),
  resetPasswordCheck('auth/reset_password/check'),
  resetPasswordConfirm('auth/reset_password/confirm');

  const Endpoint(this.endPoint);
  final String endPoint;
}
