import '../../../../marcopolo.dart';

class OpenCartEvent extends Event {
  OpenCartEvent({
    required this.offerId,
  });

  final String offerId;

  @override
  String get name => CommonEvents.openCart;

  @override
  dynamic get data => offerId;
}
