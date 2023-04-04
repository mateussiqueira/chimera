import 'package:checkout/src/ui/pages/pages.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../styles/checkout_module_style.dart';
import 'widgets/widgets.dart';

class CartPage extends StatelessWidget {
  CartPage({
    Key? key,
    required this.presenter,
    String? offerId,
  }) : super(key: key) {
    presenter.load().then((_) {
      if (offerId != null) {
        presenter.addMoreItems(offerId: offerId);
      }
    });
  }

  final CartPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: presenter,
      builder: (context) => ScaffoldBaseWidget(
        backgroundColor:
            moduleStyle.primary.backgroundModulePrimaryColor(context),
        appBar: SecondaryAppBarWidget(
          title: R.string.cart,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(Spacings.spacing16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              presenter.productsInCart?.offers?.isEmpty == false
                  ? Column(
                      children: [
                        CoursesInCartWidget(
                          courses: presenter.productsInCart?.offers,
                          delete: presenter.delete,
                        ),
                        const SpacingVertical.spacing32(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TextButtonWidget(
                              child: TextWidget.textSmMedium(
                                text: R.string.addMoreItems,
                                style: moduleStyle.primary
                                    .textModuleStyleWithPrimaryColor(context),
                              ),
                              onPressed: () {
                                Route66.pop();
                                Marcopolo().emit(
                                  OpenDiscoveryEvent(),
                                );
                              },
                            ),
                          ],
                        ),
                        const SpacingVertical.spacing32(),
                      ],
                    )
                  : Column(
                      children: [
                        const SpacingVertical.spacing32(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TextButtonWidget(
                              child: TextWidget.textSmMedium(
                                text: R.string.addMoreItems,
                                style: moduleStyle.primary
                                    .textModuleStyleWithPrimaryColor(context),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/');
                              },
                            ),
                          ],
                        ),
                        const SpacingVertical.spacing32(),
                      ],
                    )
            ],
          ),
        ),
        bottomNavigationWithoutStyle: true,
        bottomNavigationBar: presenter.productsInCart?.offers?.isEmpty == false
            ? CartValueWidget(
                installments: 10,
                iso: 'BRL',
                totalPrice: presenter.totalValue,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
