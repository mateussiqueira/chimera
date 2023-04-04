import 'package:dependencies/dependencies.dart';
import 'package:discovery/discovery.dart';

class CartEntity extends Equatable {
  const CartEntity({
    required this.id,
    required this.offers,
    required this.updatedAt,
  });

  final String? id;
  final List<OffersEntity>? offers;
  final DateTime? updatedAt;

  @override
  List get props => [id, offers, updatedAt];
}
