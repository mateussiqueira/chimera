import 'package:design_system/design_system.dart';
import 'package:discovery/src/ui/styles/discovery_module_style.dart';

import '../product_presenter.dart';

class ProductShareButtonWidget extends StatelessWidget {
  const ProductShareButtonWidget({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final ProductPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icons.share01.iconCopyWith(
        color: moduleStyle.primary.textModulePrimaryColor(context),
        size: Sizes.size24,
      ),
      color: moduleStyle.primary.textModulePrimaryColor(context),
      onPressed: () {
        presenter.shareProduct();
      },
      splashRadius: 1,
    );
  }
}
