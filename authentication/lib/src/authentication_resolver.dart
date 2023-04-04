import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../authentication.dart';
import 'data/data.dart';
import 'ui/pages/login/login.dart';
import 'ui/pages/register/register.dart';
import 'ui/pages/reset_password/reset_password.dart';

class AuthenticationResolver implements MicroApp {
  @override
  String get name => 'auth';

  final module = AuthenticationModule.initialize();

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          name: '/login-dialog',
          builder: (context, args) => LoginPage(
            presenter: module.call<LoginPresenter>(),
          ),
          transitionType: TransitionType.fullscreenDialogTransition,
        ),
        ChildRoute(
          name: '/register-dialog',
          builder: (context, args) => RegisterPage(
            presenter: module.call<RegisterPresenter>(),
            cameFromLogin: false,
          ),
          transitionType: TransitionType.fullscreenDialogTransition,
        ),
        ChildRoute(
          name: '/register',
          builder: (context, args) => RegisterPage(
            presenter: module.call<RegisterPresenter>(),
            cameFromLogin: true,
          ),
          transitionType: TransitionType.noneTransition,
        ),
        ChildRoute(
          name: '/resetPasswordAsk',
          builder: (context, args) => ResetPasswordAskPage(
            presenter: module.call<ResetPasswordAskPresenter>(),
          ),
          transitionType: TransitionType.noneTransition,
        ),
        ChildRoute(
          name: '/resetPasswordCode',
          builder: (context, args) => ResetPasswordCodePage(
            presenter: module.call<ResetPasswordCodePresenter>(),
            params: args is RemoteResetPasswordParams ? args : null,
          ),
          transitionType: TransitionType.noneTransition,
        ),
        ChildRoute(
          name: '/resetPasswordConfirm',
          builder: (context, args) => ResetPasswordConfirmPage(
            presenter: module.call<ResetPasswordConfirmPresenter>(),
            params: args is RemoteResetPasswordParams ? args : null,
          ),
          transitionType: TransitionType.noneTransition,
        ),
        ChildRoute(
          name: '/resetPasswordSuccess',
          builder: (context, args) => const ResetPasswordSuccessPage(),
          transitionType: TransitionType.noneTransition,
        ),
      ];

  @override
  void Function(Event event) get listener => (event) async {
        if (event is BuyItemEvent) {
          final localUserIsLoggedIn = module.get<UserIsLoggedIn>();
          final user = await localUserIsLoggedIn.verify();

          if (user) {
            Marcopolo().emit(OpenCartEvent(offerId: event.offerId));
          } else {
            Marcopolo().emit(DoLoginEvent());
          }
        } else if (event is DoLoginEvent) {
          Route66.pushNamed('/login-dialog');
        } else if (event is DoRegisterEvent) {
          Route66.pushNamed('/register-dialog');
        } else if (event is SomeUserLoggedInEvent) {
          final localUserIsLoggedIn = module.get<UserIsLoggedIn>();
          final user = await localUserIsLoggedIn.verify();

          if (user) {
            Marcopolo().emit(MustShowCartEvent(true));
          }
        } else if (event is DoLogoutEvent) {
          try {
            final removeAccount = module.get<LocalRemoveAccount>();
            await removeAccount.remove();
            final removeUser = module.get<LocalRemoveUser>();
            await removeUser.remove();
            Marcopolo().emit(UserLoggedOffEvent());
          } catch (_) {}
        }
      };
}
