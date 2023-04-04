import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/data/params/params.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/pages/pages.dart';

import 'mixins/mixins.dart';

class NotifierProductsListPresenter extends ChangeNotifier
    with RemotePaginationMixin
    implements ProductListPresenter {
  NotifierProductsListPresenter({
    required this.remoteLoadProducts,
  });

  final LoadProducts remoteLoadProducts;

  List<ProductEntity>? _products;

  void _update() => notifyListeners();

  @override
  Future<void> init(LoadProductsParams params) async {
    if (params is RemoteLoadProductsParams) {
      this.params = params.copyWith(
        page: 1,
        items: 10,
      );
    }
    load();
  }

  @override
  Future<void> load() async {
    LoadingWidget.show();

    try {
      final params = this.params;
      if (params != null) {
        final products = await remoteLoadProducts.load(
          params,
        );

        _products = [
          ...?_products,
          ...products.data,
        ];

        pagination = products.pagination;

        _update();
      }
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }

    LoadingWidget.hide();
  }

  @override
  List<ProductEntity>? get products => _products;

  @override
  PaginationEntity? pagination;

  @override
  LoadProductsParams? params;
}
