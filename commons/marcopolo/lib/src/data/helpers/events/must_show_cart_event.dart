import 'package:marcopolo/marcopolo.dart';

class MustShowCartEvent extends Event {
  MustShowCartEvent([this.show]);

  final bool? show;

  @override
  String get name => CommonEvents.mustShowCart;

  @override
  dynamic get data => show;
}
