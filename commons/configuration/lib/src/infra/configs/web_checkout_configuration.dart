class WebCheckoutConfiguration {
  const WebCheckoutConfiguration({
    required String entryPoint,
    required String redirectTo,
  })  : _entryPoint = entryPoint,
        _redirectTo = redirectTo;

  final String _entryPoint;
  final String _redirectTo;

  String url({
    required String jwtToken,
    required String refreshToken,
  }) {
    final token = "token=$jwtToken";
    final refresh = "refreshToken=$refreshToken";
    final redirect = "redirectUrl=$_redirectTo";
    final parameters = "$token&$refresh&$redirect";
    return '$_entryPoint?$parameters';
  }
}
