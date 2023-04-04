import 'package:checkout/src/domain/domain.dart';
import 'package:flutter/material.dart';

abstract class CartPresenter implements Listenable {
  Future<void> load();
  Future<void> delete({required String? offerId});
  Future<void> addOfferToCart({required String? offerId});

  Future<void> addMoreItems({required String offerId});

  CartEntity? get productsInCart;
  int get totalValue;
}
