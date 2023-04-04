import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/data/data.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/presentation/presentation.dart';
import 'package:discovery/src/ui/pages/pages.dart';

class DiscoveryModule {
  static Alligator initialize() {
    var alligator = Alligator();

    alligator.register<LoadProducts>(
      () => RemoteLoadProducts(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url('/products'),
      ),
    );

    alligator.register<LoadCategories>(
      () => RemoteLoadCategories(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url('/products/categories'),
      ),
    );

    alligator.register<LoadRecentlyViewedProducts>(
      () => LocalLoadRecentlyViewedProducts(
        storage: alligator.get<PreferencesStorageAdapter>(),
      ),
    );

    alligator.register<HomePresenter>(
      () => NotifierHomePresenter(
        remoteLoadCategories: alligator.get<LoadCategories>(),
        remoteLoadProducts: alligator.get<LoadProducts>(),
        localLoadRecentlyViewedProducts:
            alligator.get<LoadRecentlyViewedProducts>(),
      ),
    );

    alligator.register<NotifierProductsListPresenter>(
      () => NotifierProductsListPresenter(
        remoteLoadProducts: alligator.get<LoadProducts>(),
      ),
    );

    alligator.register<NotifierProductsWhoBoughtListPresenter>(
      () => NotifierProductsWhoBoughtListPresenter(
        remoteLoadProductsUsersBought: alligator.get<LoadProductsUsersBought>(),
      ),
    );

    alligator.register<SearchHomePresenter>(
      () => NotifierSearchHomePresenter(
        remoteLoadCategories: alligator.get<LoadCategories>(),
      ),
    );

    alligator.register<LoadRecentSearches>(
      () => LocalLoadRecentSearches(
        storage: alligator.get<PreferencesStorageAdapter>(),
      ),
    );

    alligator.register<AddRecentSearch>(
      () => LocalAddRecentSearch(
        storage: alligator.get<PreferencesStorageAdapter>(),
      ),
    );

    alligator.register<RemoveRecentSearch>(
      () => LocalRemoveRecentSearch(
        storage: alligator.get<PreferencesStorageAdapter>(),
      ),
    );

    alligator.register<CategoryInfoPresenter>(
      () => NotifierCategoryInfoPresenter(
        remoteLoadProducts: alligator.get<LoadProducts>(),
      ),
    );

    alligator.register<SearchPresenter>(
      () => NotifierSearchPresenter(
        remoteLoadProducts: alligator.get<LoadProducts>(),
        localLoadRecentSearches: alligator.get<LoadRecentSearches>(),
        localAddRecentSearch: alligator.get<AddRecentSearch>(),
        localRemoveRecentSearch: alligator.get<RemoveRecentSearch>(),
      ),
    );

    alligator.register<LoadProduct>(
      () => RemoteLoadProduct(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url('/products/by_slug/{SLUG}'),
      ),
    );

    alligator.register<LoadProductsUsersBought>(
      () => RemoteLoadProductsUsersBought(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url(
          '/products/{ID}/products_who_users_also_bought',
        ),
      ),
    );

    alligator.register<AddRecentViewedProduct>(
      () => LocalAddRecentViewedProduct(
        storage: alligator.get<PreferencesStorageAdapter>(),
      ),
    );

    alligator.register<ProductPresenter>(
      () => NotifierProductPresenter(
        remoteLoadProduct: alligator.get<LoadProduct>(),
        remoteLoadProductUsersBought: alligator.get<LoadProductsUsersBought>(),
        shareContent: alligator.get<ShareContent>(),
        addRecentViewedProduct: alligator.get<AddRecentViewedProduct>(),
      ),
    );

    return alligator;
  }
}
