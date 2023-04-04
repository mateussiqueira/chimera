import 'package:dependencies/dependencies.dart';

class PriceEntity extends Equatable {
  const PriceEntity({
    required this.cents,
    required this.currencyIso,
  });

  final int? cents;
  final String? currencyIso;

  @override
  List get props => [cents, currencyIso];
}
