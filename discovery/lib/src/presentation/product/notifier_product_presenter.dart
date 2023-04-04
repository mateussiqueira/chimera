import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/data/params/params.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/pages/pages.dart';

class NotifierProductPresenter extends NotifierUpdatePresenter
    implements ProductPresenter {
  NotifierProductPresenter({
    required this.remoteLoadProduct,
    required this.remoteLoadProductUsersBought,
    required this.shareContent,
    required this.addRecentViewedProduct,
  });

  final LoadProduct remoteLoadProduct;
  final LoadProductsUsersBought remoteLoadProductUsersBought;
  final ShareContent shareContent;
  final AddRecentViewedProduct addRecentViewedProduct;

  ProductEntity? _product;
  ProductsEntity? _productsUsersBought;
  final LoadProductsParams _usersBoughtParams = const RemoteLoadProductsParams(
    items: 3,
  );
  bool _bottomNavFixed = true;

  @override
  Future<void> init(ProductEntity product) async {
    LoadingWidget.show();
    try {
      _product = product;
      await Future.wait(
        [
          load(silentFetch: true),
          loadProductsUsersBought(silentFetch: true),
        ],
      );
      addRecentViewedProduct.add(product);
    } catch (_) {}

    LoadingWidget.hide();
  }

  @override
  Future<void> load({bool silentFetch = false}) async {
    if (!silentFetch) {
      LoadingWidget.show();
    }

    try {
      final slug = _product?.slug;
      if (slug == null) {
        ToastWidget.showGenericError();
        return;
      }

      _product = await remoteLoadProduct.load(slug: slug);

      update();
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }

    if (!silentFetch) {
      LoadingWidget.hide();
    }
  }

  @override
  Future<void> loadProductsUsersBought({bool silentFetch = false}) async {
    if (!silentFetch) {
      LoadingWidget.show();
    }

    try {
      final id = _product?.id;
      if (id == null) {
        ToastWidget.showGenericError();
        return;
      }

      _productsUsersBought = await remoteLoadProductUsersBought.load(
        id,
        _usersBoughtParams,
      );

      update();
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }

    if (!silentFetch) {
      LoadingWidget.hide();
    }
  }

  @override
  Future<void> shareProduct() async {
    try {
      final slug = _product?.slug;
      if (slug == null) {
        ToastWidget.showGenericError();
        return;
      }

      final url = ConfigurationManager.product.url(slug: slug);

      await shareContent.shareLink(url);
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }
  }

  @override
  ProductEntity? get product => _product;

  @override
  ProductsEntity? get productsUsersBought => _productsUsersBought;

  @override
  LoadProductsParams get productsUsersBoughtParams =>
      (_usersBoughtParams as RemoteLoadProductsParams).copyWith(
        productId: _product?.id,
      );

  @override
  bool get bottomNavFixed => _bottomNavFixed;

  @override
  void setNavFixed(bool value) {
    if (_bottomNavFixed != value) {
      _bottomNavFixed = value;
      update();
    }
  }
}
