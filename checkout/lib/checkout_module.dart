import 'package:checkout/src/data/data.dart';
import 'package:checkout/src/domain/domain.dart';
import 'package:checkout/src/presentation/presentation.dart';
import 'package:checkout/src/ui/pages/pages.dart';
import 'package:dependencies/dependencies.dart';

class CheckoutModule {
  static final alligator = Alligator();

  static Alligator initialize() {
    alligator.register<LoadCart>(
      () => RemoteLoadCart(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url('/cart'),
        loadAccount: alligator.get<LoadAccount>(),
      ),
    );

    alligator.register<UpdateCart>(
      () => RemoteUpdateCart(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url('/cart'),
        loadAccount: alligator.get<LoadAccount>(),
      ),
    );

    alligator.register<CartPresenter>(
      () => NotifierCartPresenter(
        loadCart: alligator.get<LoadCart>(),
        updateCart: alligator.get<UpdateCart>(),
      ),
    );

    alligator.register<CheckoutPresenter>(
      () => NotifierCheckoutPresenter(
        loadAccount: alligator.get<LoadAccount>(),
        httpClient: alligator.get<HttpClient>(),
        shareContent: alligator.get<ShareContent>(),
      ),
    );

    return alligator;
  }
}
