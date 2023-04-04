import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/ui/styles/discovery_module_style.dart';

import '../product_presenter.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final ProductPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size32,
      ),
      child: ListenableBuilder(
        listenable: presenter,
        builder: (context) {
          int durationInHours =
              presenter.product?.productable?.durationInHours ?? 16;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoIcon(Icons.clock, '${durationInHours}h', context),
              _infoIcon(Icons.certificate01, R.string.institutionalCertificate,
                  context),
              _infoIcon(Icons.globe03, R.string.online, context),
            ],
          );
        },
      ),
    );
  }

  Widget _infoIcon(Icons icon, String title, BuildContext context) {
    return Column(
      children: [
        icon.iconCopyWith(
          color: moduleStyle.tertiary.textModulePrimaryColor(context),
        ),
        const SpacingVertical.spacing04(),
        TextWidget.textSmNormal(
          text: title,
          style: moduleStyle.tertiary.textModuleStyleWithPrimaryColor(context),
        ),
      ],
    );
  }
}
