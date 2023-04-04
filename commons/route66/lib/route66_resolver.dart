import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

class Route66Module {
  static Alligator initialize() {
    var alligator = Alligator();

    return alligator;
  }
}

class Route66Resolver implements MicroApp {
  Route66Resolver({
    required this.microApps,
    required this.initialRoute,
    required this.items,
  });

  final List<MicroApp> microApps;
  final String initialRoute;
  final List<NavbarItem> items;

  @override
  String get name => 'route66';

  final module = Route66Module.initialize();

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          name: '/',
          builder: (context, args) => Route66Page(
            microApps: microApps,
            initialRoute: initialRoute,
            items: items,
          ),
          transitionType: TransitionType.noneTransition,
        ),
      ];

  @override
  void Function(Event event) get listener => (event) async {
        if (event is MustShowCartEvent) {
          if (event.show == true) {
            Marcopolo().emit(ShowCartEvent());
          } else {
            Marcopolo().emit(SomeUserLoggedInEvent());
          }
        }
      };
}
