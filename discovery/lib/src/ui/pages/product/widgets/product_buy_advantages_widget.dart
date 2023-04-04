import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../../styles/discovery_module_style.dart';

class ProductBuyAdvantagesWidget extends StatelessWidget {
  const ProductBuyAdvantagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: moduleStyle.secondary.backgroundModulePrimaryColor(context),
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size28,
        horizontal: Sizes.size16,
      ),
      child: Column(
        children: [
          SectionHeaderWidget(
            title: R.string.buyCourseAdvantages,
            titleColor: moduleStyle.quaternary.textModulePrimaryColor(context),
            iconColor: moduleStyle.tertiary.textModuleSecondaryColor(context),
          ),
          const SpacingVertical.spacing20(),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              final card = _cardsList(context)[index];
              return card;
            },
            separatorBuilder: (context, index) {
              return const SpacingVertical.spacing24();
            },
            itemCount: _cardsList(context).length,
          )
        ],
      ),
    );
  }

  List<Widget> _cardsList(BuildContext context) => [
        generateCard(Icons.messageChatCircle, R.string.buyAdvantageTitle01,
            R.string.buyAdvantageDescription01, context),
        generateCard(Icons.certificate01, R.string.buyAdvantageTitle02,
            R.string.buyAdvantageDescription02, context),
        generateCard(Icons.signal02, R.string.buyAdvantageTitle03,
            R.string.buyAdvantageDescription03, context),
        generateCard(Icons.graduationHat01, R.string.buyAdvantageTitle04,
            R.string.buyAdvantageDescription04, context),
      ];

  Widget generateCard(
      Icons icon, String title, String description, BuildContext context) {
    return Row(
      children: [
        icon.iconCopyWith(
          color: moduleStyle.tertiary.backgroundModuleSecondaryColor(context),
          size: Sizes.size40,
        ),
        const SpacingHorizontal.spacing12(),
        Expanded(
          child: TextWidget.textSmBold(
            text: title,
            style:
                moduleStyle.secondary.textModuleStyleWithPrimaryColor(context),
          ),
        ),
        const SpacingHorizontal.spacing08(),
        Expanded(
          child: TextWidget.textXsNormal(
            text: description,
            style: moduleStyle.secondary
                .textModuleStyleWithSecondaryColor(context),
          ),
        ),
      ],
    );
  }
}
