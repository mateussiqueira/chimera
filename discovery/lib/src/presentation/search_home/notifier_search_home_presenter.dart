import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/data/params/params.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/pages/pages.dart';

class NotifierSearchHomePresenter extends ChangeNotifier
    implements SearchHomePresenter {
  NotifierSearchHomePresenter({
    required this.remoteLoadCategories,
  }) {
    loadCategories();
  }

  final LoadCategories remoteLoadCategories;

  List<CategoryEntity> _categories = [];

  final _topSearchedParams = const RemoteLoadProductsParams(
    sort: ProductSort.mostSearched,
  );
  final _mostPurchasedParams = const RemoteLoadProductsParams(
    sort: ProductSort.bestSellers,
  );

  void _update() => notifyListeners();

  @override
  Future<void> loadCategories() async {
    LoadingWidget.show();

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

    LoadingWidget.hide();
  }

  @override
  List<CategoryEntity> get categories => _categories;

  @override
  LoadProductsParams get topSearchedParams => _topSearchedParams;

  @override
  LoadProductsParams get mostPurchasedParams => _mostPurchasedParams;
}
