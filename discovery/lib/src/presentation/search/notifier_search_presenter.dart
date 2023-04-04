import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/data/params/params.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/pages/pages.dart';

class NotifierSearchPresenter extends ChangeNotifier
    implements SearchPresenter {
  NotifierSearchPresenter({
    required this.remoteLoadProducts,
    required this.localLoadRecentSearches,
    required this.localAddRecentSearch,
    required this.localRemoveRecentSearch,
  });

  final LoadProducts remoteLoadProducts;
  final LoadRecentSearches localLoadRecentSearches;
  final AddRecentSearch localAddRecentSearch;
  final RemoveRecentSearch localRemoveRecentSearch;

  ProductsEntity? _mostSearchedProducts;
  String _search = '';
  RemoteLoadProductsParams _searchParams = const RemoteLoadProductsParams(
    items: 10,
  );
  List<ProductEntity>? _searchedProducts;
  PaginationEntity? _pagination;
  List<String>? _recentSearchesList;

  void _update() => notifyListeners();

  @override
  Future<void> init(String? query) async {
    LoadingWidget.show();

    if (query != null) {
      search = query;
    }

    await Future.wait(
      [
        if (query != null) doSearch(silentFetch: true),
        loadMostSearches(silentFetch: true),
        loadRecentSearches(silentFetch: true),
      ],
    );

    LoadingWidget.hide();
  }

  @override
  set search(String search) {
    _search = search;
    _update();
  }

  @override
  String get search => _search;

  @override
  Future<void> loadMostSearches({bool silentFetch = false}) async {
    if (!silentFetch) {
      LoadingWidget.show();
    }

    try {
      _mostSearchedProducts = await remoteLoadProducts.load(
        const RemoteLoadProductsParams(
          items: 3,
          sort: ProductSort.mostSearched,
        ),
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
  ProductsEntity? get mostSearchedProducts => _mostSearchedProducts;

  @override
  Future<void> doSearch({bool silentFetch = false}) async {
    try {
      if (!silentFetch) {
        LoadingWidget.show();
      }
      if (_search.isEmpty) {
        _searchedProducts = null;
        await loadRecentSearches();
        return;
      } else if (_search != _searchParams.query) {
        _searchParams = _searchParams.copyWith(query: _search, page: 1);
        _searchedProducts = null;
        localAddRecentSearch.add(_search);
      } else {
        if (_searchParams.page == _pagination?.page) {
          return;
        }
      }
      final products = await remoteLoadProducts.load(
        _searchParams,
      );

      _searchedProducts = [
        ...?_searchedProducts,
        ...products.data,
      ];

      _pagination = products.pagination;

      _update();
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    } finally {
      if (!silentFetch) {
        LoadingWidget.hide();
      }
    }
  }

  @override
  Future<void> loadRecentSearches({bool silentFetch = false}) async {
    if (!silentFetch) {
      LoadingWidget.show();
    }

    try {
      _recentSearchesList = await localLoadRecentSearches.load();

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
  Future<void> nextPage() async {
    final pagination = _pagination;
    final params = _searchParams;
    if (pagination != null) {
      if (params.page < (pagination.totalPages ?? 0)) {
        _searchParams = params.copyWith(page: _searchParams.page + 1);
        await doSearch();
      }
    }
  }

  @override
  bool get isSearchEnabled => _search.isNotEmpty && _search.length > 1;

  @override
  List<ProductEntity>? get searchedProducts => _searchedProducts;

  @override
  List<String>? get recentSearchesList => _recentSearchesList;

  @override
  Future<void> removeSearch(String search) async {
    try {
      await localRemoveRecentSearch.remove(search);
      await loadRecentSearches();
    } catch (_) {
      ToastWidget.showGenericError();
    }
  }
}
