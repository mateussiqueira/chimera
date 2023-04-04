import 'package:design_system/design_system.dart';
import 'package:discovery/src/ui/pages/pages.dart';

import '../../../styles/discovery_module_style.dart';

class ProductTitleWidget extends StatelessWidget {
  const ProductTitleWidget({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final ProductPresenter presenter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size16,
      ),
      child: TextWidget.displayXxlBold(
        text: presenter.product?.name ?? '',
        style: moduleStyle.tertiary.textModuleStyleWithPrimaryColor(context),
        textAlign: TextAlign.center,
      ),
    );
  }
}
