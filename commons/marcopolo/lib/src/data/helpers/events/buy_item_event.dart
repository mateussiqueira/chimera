import 'package:marcopolo/marcopolo.dart';

class BuyItemEvent extends Event {
  BuyItemEvent({
    required this.offerId,
  });

  final String offerId;

  @override
  String get name => CommonEvents.buyItem;

  @override
  dynamic get data => offerId;
}
