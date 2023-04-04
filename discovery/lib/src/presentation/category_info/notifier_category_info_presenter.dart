import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/data/params/params.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/pages/pages.dart';

class NotifierCategoryInfoPresenter extends ChangeNotifier
    implements CategoryInfoPresenter {
  NotifierCategoryInfoPresenter({
    required this.remoteLoadProducts,
  });

  final LoadProducts remoteLoadProducts;

  RemoteLoadProductsParams _params = const RemoteLoadProductsParams();
  List<ProductEntity>? _products;
  PaginationEntity? _pagination;

  void _update() => notifyListeners();

  @override
  Future<void> init(CategoryEntity category) async {
    _params = RemoteLoadProductsParams(
      categorySlug: category.slug,
    );

    load();
  }

  @override
  Future<void> load() async {
    LoadingWidget.show();

    try {
      final products = await remoteLoadProducts.load(
        _params,
      );

      _products = [
        ...?_products,
        ...products.data,
      ];

      _pagination = products.pagination;

      _update();
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }

    LoadingWidget.hide();
  }

  @override
  Future<void> nextPage() async {
    final pagination = _pagination;
    if (pagination != null) {
      if (_params.page < (pagination.totalPages ?? 0)) {
        _params = _params.copyWith(page: _params.page + 1);
        await load();
      }
    }
  }

  @override
  List<ProductEntity>? get products => _products;
}
