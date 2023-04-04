import 'package:cart/cart.dart';
import 'package:courses/courses.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/widgets/widgets.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'product_presenter.dart';
import 'widgets/widgets.dart';

class ProductPage extends StatelessWidget {
  ProductPage({
    super.key,
    required this.presenter,
    required ProductEntity product,
    required this.cart,
  }) {
    presenter.init(product);
  }

  final GlobalKey priceKey = GlobalKey();
  final ProductPresenter presenter;
  final CartWidget cart;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBaseWidget(
      appBar: SecondaryAppBarWidget(
        title: presenter.product?.name ?? '',
        actions: [
          ProductShareButtonWidget(
            presenter: presenter,
          ),
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          VisibilityDetectorController.instance.notifyNow();

          return true;
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: Sizes.size16),
          child: Column(
            children: [
              ProductImageWidget(
                product: presenter.product,
                height: 190,
                width: double.infinity,
              ),
              const SpacingVertical.spacing12(),
              ProductTitleWidget(presenter: presenter),
              ProductDescriptionWidget(presenter: presenter),
              ProductInfoWidget(presenter: presenter),
              const SpacingVertical.spacing24(),
              ListenableBuilder(
                listenable: presenter,
                builder: (context) {
                  final goals = presenter.product?.info?.goals;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacings.spacing16,
                    ),
                    child: ProductGoalsWidget(
                      presenter: presenter,
                      goals: goals,
                    ),
                  );
                },
              ),
              const SpacingVertical.spacing24(),
              ListenableBuilder(
                listenable: presenter,
                builder: (context) {
                  final duration =
                      presenter.product?.productable?.durationInHours;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacings.spacing16,
                    ),
                    child: ProductExpectationsWidget(
                      presenter: presenter,
                      durationInHours: duration ?? 16,
                    ),
                  );
                },
              ),
              const SpacingVertical.spacing40(),
              ProductContentWidget(presenter: presenter),
              const ProductBuyAdvantagesWidget(),
              ProductWhoBoughtAlsoSawWidget(presenter: presenter),
              VisibilityDetector(
                key: priceKey,
                onVisibilityChanged: (visibilityInfo) {
                  if (visibilityInfo.visibleFraction == 0) {
                    presenter.setNavFixed(true);
                  } else {
                    presenter.setNavFixed(false);
                  }
                },
                child: ProductPriceAddToCartWidget(
                  product: presenter.product,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ListenableBuilder(
        listenable: presenter,
        builder: (context) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            child: presenter.bottomNavFixed
                ? ProductPriceAddToCartWidget(
                    product: presenter.product,
                    isFixed: true,
                  )
                : const EmptyWidget(),
          );
        },
      ),
      roundedBottomNavigationBar: false,
      bottomNavigationBarSafeArea: false,
      resizeToAvoidBottomInset: false,
      floatActionButton: cart,
    );
  }
}
