import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/presentation/presentation.dart';

import 'discovery_module.dart';
import 'domain/domain.dart';
import 'ui/pages/pages.dart';

class DiscoveryResolver implements MicroApp {
  @override
  String get name => '/discovery/';

  final module = DiscoveryModule.initialize();

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          name: '/discovery/',
          builder: (context, args) => HomePage(
            presenter: module.get(),
          ),
          transitionType: TransitionType.noneTransition,
        ),
        ChildRoute(
          name: '/discovery/product-list/who-bought-also-view',
          builder: (context, args) => ProductList(
            title: (args as Map<String, dynamic>)['title'],
            params: args['params'],
            presenter: module.get<NotifierProductsWhoBoughtListPresenter>(),
          ),
        ),
        ChildRoute(
          name: '/discovery/product-list',
          builder: (context, args) => ProductList(
            title: (args as Map<String, dynamic>)['title'],
            params: args['params'],
            presenter: module.get<NotifierProductsListPresenter>(),
          ),
        ),
        ChildRoute(
          name: '/discovery/search-home',
          builder: (context, args) => SearchHomePage(
            presenter: module.get(),
          ),
          transitionType: TransitionType.noneTransition,
        ),
        ChildRoute(
          name: '/discovery/search',
          builder: (context, args) => SearchPage(
            presenter: module.get(),
            query: args as String?,
          ),
          transitionType: TransitionType.noneTransition,
        ),
        ChildRoute(
          name: '/discovery/category-info',
          builder: (context, args) => CategoryInfoPage(
            presenter: module.get(),
            category: args as CategoryEntity,
          ),
        ),
        ChildRoute(
          name: '/discovery/product',
          builder: (context, args) => ProductPage(
            presenter: module.get(),
            cart: module.get<CartWidget>(),
            product: args as ProductEntity,
          ),
        ),
      ];

  @override
  void Function(Event event) get listener => (event) {
        if (event is OpenDiscoveryEvent) {
          Route66.popToRoot(rootNavigator: false);
          Route66.navigate('/discovery/');
        }
      };
}
