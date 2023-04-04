import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/data/params/params.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/pages/pages.dart';

import 'mixins/mixins.dart';

class NotifierProductsWhoBoughtListPresenter extends ChangeNotifier
    with RemotePaginationMixin
    implements ProductListPresenter {
  NotifierProductsWhoBoughtListPresenter({
    required this.remoteLoadProductsUsersBought,
  });

  final LoadProductsUsersBought remoteLoadProductsUsersBought;

  List<ProductEntity>? _products;
  String? id;

  void _update() => notifyListeners();

  @override
  Future<void> init(LoadProductsParams params) async {
    if (params is RemoteLoadProductsParams) {
      id = params.productId;
      this.params = const RemoteLoadProductsParams();
    }
    load();
  }

  @override
  Future<void> load() async {
    LoadingWidget.show();

    try {
      final id = this.id;
      final params = this.params;
      if (params != null && id != null) {
        final products = await remoteLoadProductsUsersBought.load(
          id,
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
