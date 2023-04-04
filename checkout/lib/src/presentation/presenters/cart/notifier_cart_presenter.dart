import 'dart:async';

import 'package:checkout/src/domain/domain.dart';
import 'package:checkout/src/ui/pages/pages.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

class NotifierCartPresenter extends NotifierUpdatePresenter
    implements CartPresenter {
  NotifierCartPresenter({
    required this.loadCart,
    required this.updateCart,
  });

  final LoadCart loadCart;
  final UpdateCart updateCart;

  CartEntity? _productsInCart;
  List<String> _offerIds = [];

  @override
  Future<void> load() async {
    try {
      final result = await loadCart.load();
      _productsInCart = result;

      final offers = result.offers;
      _offerIds = offers?.map((e) => e.id ?? '').toList() ?? [];
      _offerIds.removeWhere((element) => element.isEmpty);
      Marcopolo().emit(UpdateCartItemsEvent());

      update();
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }
  }

  @override
  Future<void> delete({required String? offerId}) async {
    try {
      _offerIds.remove(offerId);

      await updateCart.update(offerIds: _offerIds);
      await load();
      Marcopolo().emit(UpdateCartItemsEvent());
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }
  }

  @override
  Future<void> addOfferToCart({required String? offerId}) async {
    try {
      if (offerId != null) {
        _offerIds.add(offerId);

        await updateCart.update(offerIds: _offerIds);
        await load();
      }
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }
  }

  @override
  Future<void> addMoreItems({required String offerId}) async {
    try {
      _offerIds.add(offerId);

      await updateCart.update(offerIds: _offerIds);
      await load();
      Marcopolo().emit(UpdateCartItemsEvent());
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }
  }

  @override
  CartEntity? get productsInCart => _productsInCart;

  int _totalValue() {
    final prices = _productsInCart?.offers
        ?.map(
          (e) => e.price?.cents ?? 0,
        )
        .toList();

    final total = prices?.reduce((value, element) => value + element) ?? 0;

    return total;
  }

  @override
  int get totalValue => _totalValue();
}
