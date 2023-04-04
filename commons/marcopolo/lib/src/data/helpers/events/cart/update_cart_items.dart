import 'package:marcopolo/marcopolo.dart';

class UpdateCartItemsEvent extends Event {
  UpdateCartItemsEvent([
    this.offerId,
  ]);

  final String? offerId;
  @override
  String get name => CommonEvents.updateCartItemsEvent;
  @override
  dynamic get data => offerId;
}
