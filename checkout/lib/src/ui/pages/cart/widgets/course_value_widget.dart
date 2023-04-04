import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../../styles/checkout_module_style.dart';

class CartValueWidget extends StatelessWidget {
  const CartValueWidget({
    super.key,
    required this.totalPrice,
    required this.installments,
    required this.iso,
  });

  final int totalPrice;
  final int installments;
  final String iso;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacings.spacing16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HorizontalDividerWidget(
            style: HorizontalDividerStyle.light,
          ),
          const SpacingVertical.spacing16(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextWidget.textLgBold(
                text: R.string.total,
                style: moduleStyle.primary
                    .textModuleStyleWithPrimaryColor(context),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextWidget.textLgBold(
                    text:
                        '${R.string.price(totalPrice, iso)} ${R.string.inCash}',
                    style: moduleStyle.primary
                        .textModuleStyleWithPrimaryColor(context),
                  ),
                  const SpacingVertical.spacing04(),
                  TextWidget.textSmNormal(
                    text: R.string
                        .installmentsPrice(installments, totalPrice, iso),
                    style: moduleStyle.primary
                        .textModuleStyleWithSecondaryColor(context),
                  ),
                ],
              ),
            ],
          ),
          const SpacingVertical.spacing16(),
          SizedBox(
            width: Sizes.sizeInfinity,
            child: PrimaryButton.sizeXl(
              text: R.string.finalizeOrder,
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                  ..pop()
                  ..pushNamed('/checkout');
              },
            ),
          ),
          const SpacingVertical.spacing24(),
        ],
      ),
    );
  }
}
