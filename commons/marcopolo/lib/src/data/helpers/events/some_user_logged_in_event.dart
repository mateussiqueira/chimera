import 'package:marcopolo/marcopolo.dart';

class SomeUserLoggedInEvent extends Event {
  @override
  String get name => CommonEvents.someUserLoggedIn;
}
