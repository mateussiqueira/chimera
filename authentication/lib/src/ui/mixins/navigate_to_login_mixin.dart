import 'package:design_system/design_system.dart';

mixin NavigateToLoginMixin {
  void popToLogin(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName('/login-dialog'));
  }

  void popToRoot(BuildContext context) {
    Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
  }
}
