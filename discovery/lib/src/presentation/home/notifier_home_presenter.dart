import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/data/params/params.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/pages/home/home.dart';

class NotifierHomePresenter extends ChangeNotifier implements HomePresenter {
  NotifierHomePresenter({
    required this.remoteLoadCategories,
    required this.remoteLoadProducts,
    required this.localLoadRecentlyViewedProducts,
  }) {
    _init();
  }

  final LoadCategories remoteLoadCategories;
  final LoadProducts remoteLoadProducts;
  final LoadRecentlyViewedProducts localLoadRecentlyViewedProducts;

  CategoryEntity? _selectedCategory;
  List<CategoryEntity>? _categories;
  ProductsEntity? _mostSearchedProducts;
  ProductsEntity? _recentViewedProducts;
  ProductsEntity? _selectedCategoryProducts;
  final _mostSearchedParams = const RemoteLoadProductsParams(
    items: 3,
    sort: ProductSort.mostSearched,
  );
  RemoteLoadProductsParams _categoryParams = const RemoteLoadProductsParams(
    items: 3,
  );
  RemoteLoadProductsParams _recentViewedParams = const RemoteLoadProductsParams(
    items: 3,
  );

  void _update() => notifyListeners();

  Future<void> _init() async {
    LoadingWidget.show();

    await Future.wait(
      [
        loadCategories(silentFetch: true),
        loadMostSearchedProducts(silentFetch: true),
        loadRecentViewedProducts(silentFetch: true),
      ],
    );

    final loadedCategories = _categories;

    if (loadedCategories != null && loadedCategories.isNotEmpty) {
      await loadProductFromCategory(
        loadedCategories.first,
        silentFetch: true,
      );
    }

    LoadingWidget.hide();
  }

  @override
  Future<void> loadCategories({bool silentFetch = false}) async {
    if (!silentFetch) {
      LoadingWidget.show();
    }

    try {
      final fetchedCategories = await remoteLoadCategories.load();
      _categories = fetchedCategories;
      _update();
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }

    if (!silentFetch) {
      LoadingWidget.hide();
    }
  }

  @override
  Future<void> loadMostSearchedProducts({bool silentFetch = false}) async {
    if (!silentFetch) {
      LoadingWidget.show();
    }

    try {
      _mostSearchedProducts = await remoteLoadProducts.load(
        _mostSearchedParams,
      );

      _update();
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }

    if (!silentFetch) {
      LoadingWidget.hide();
    }
  }

  @override
  Future<void> loadProductFromCategory(
    CategoryEntity category, {
    bool silentFetch = false,
  }) async {
    if (!silentFetch) {}

    try {
      _categoryParams = _categoryParams.copyWith(
        categorySlug: category.slug,
      );

      _selectedCategoryProducts = await remoteLoadProducts.load(
        _categoryParams,
      );

      _selectedCategory = category;

      _update();
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }

    if (!silentFetch) {}
  }

  @override
  Future<void> loadRecentViewedProducts({bool silentFetch = false}) async {
    if (!silentFetch) {
      LoadingWidget.show();
    }

    try {
      final recentProductsIds = await localLoadRecentlyViewedProducts.load();
      if (recentProductsIds.isNotEmpty) {
        _recentViewedParams = _recentViewedParams.copyWith(
          productsIds: recentProductsIds,
        );

        _recentViewedProducts = await remoteLoadProducts.load(
          _recentViewedParams,
        );

        _recentViewedProducts?.data.sort((a, b) =>
            recentProductsIds.indexWhere((element) => element == a.id) -
            recentProductsIds.indexWhere((element) => element == b.id));
      }

      _update();
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }

    if (!silentFetch) {
      LoadingWidget.hide();
    }
  }

  @override
  List<CategoryEntity>? get categories => _categories;

  @override
  ProductsEntity? get selectedCategoryProducts => _selectedCategoryProducts;

  @override
  ProductsEntity? get mostSearchedProducts => _mostSearchedProducts;

  @override
  ProductsEntity? get recentViewedProducts => _recentViewedProducts;

  @override
  CategoryEntity? get selectedCategory => _selectedCategory;

  @override
  LoadProductsParams get mostSearchedParams => _mostSearchedParams;

  @override
  LoadProductsParams get recentViewedParams => _recentViewedParams;

  @override
  LoadProductsParams get selectedCategoryParams => _categoryParams;
}
