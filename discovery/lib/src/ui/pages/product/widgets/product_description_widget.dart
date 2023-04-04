import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/ui/pages/pages.dart';
import 'package:discovery/src/ui/styles/discovery_module_style.dart';

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({
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
      child: ListenableBuilder(
        listenable: presenter,
        builder: (context) {
          final description = presenter.product?.description;
          if (description != null) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SpacingVertical.spacing04(),
                ExpandWidget(
                  collapsedHeight: Sizes.size76,
                  expandText: R.string.seeMore,
                  retractText: R.string.seeLess,
                  child: TextWidget.textMdNormal(
                    text: description,
                    style: moduleStyle.primary
                        .textModuleStyleWithPrimaryColor(context),
                  ),
                ),
              ],
            );
          }
          return const SpacingVertical.spacing24();
        },
      ),
    );
  }
}
