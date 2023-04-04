import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/pages/pages.dart';

import '../../../styles/discovery_module_style.dart';

class SuggestionForYouWidget extends StatelessWidget {
  const SuggestionForYouWidget({
    super.key,
    required this.presenter,
  });

  final SearchHomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget.displayMdBold(
          text: R.string.suggestionsForYou,
          style: moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
        ),
        const SpacingVertical.spacing08(),
        Row(
          children: [
            _card(R.string.topSearches, context),
            const SpacingHorizontal.spacing08(),
            _card(R.string.mostPurchased, context),
          ],
        ),
      ],
    );
  }

  Widget _card(String title, BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context, rootNavigator: true).pushNamed(
            '/discovery/product-list',
            arguments: <String, dynamic>{
              'title': title,
              'params': _groupParams[title],
            },
          );
        },
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.size16),
            gradient: RadialGradient(
              radius: 2,
              colors: [
                moduleStyle.secondary.backgroundModulePrimaryColor(context) ??
                    Colors.transparent,
                moduleStyle.secondary.backgroundModuleSecondaryColor(context) ??
                    Colors.transparent,
              ],
            ),
          ),
          child: Center(
            child: TextWidget.displayMdMedium(
              text: title,
              style: moduleStyle.quaternary.textModuleStyleWithPrimaryColor(
                context,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Map<String, LoadProductsParams> get _groupParams => {
        R.string.topSearches: presenter.topSearchedParams,
        R.string.mostPurchased: presenter.mostPurchasedParams,
      };
}
