import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:profile/src/ui/ui.dart';

import 'profile_module.dart';

class ProfileResolver implements MicroApp {
  @override
  String get name => '/profile/';

  final module = ProfileModule.initialize();

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          name: '/profile/',
          builder: (context, args) => ProfilePage(
            presenter: module.get(),
          ),
          transitionType: TransitionType.noneTransition,
        ),
        ChildRoute(
          name: '/my-certificates/',
          builder: (context, args) => MyCertificatesPage(
            presenter: module.get(),
          ),
          transitionType: TransitionType.noneTransition,
        ),
        ChildRoute(
          name: '/account-deletion/',
          builder: (context, args) => AccountDeletionPage(
            presenter: module.get(),
          ),
          transitionType: TransitionType.noneTransition,
        ),
      ];

  @override
  void Function(Event event) get listener => (event) {};
}
