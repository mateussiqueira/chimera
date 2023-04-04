import 'package:design_system/design_system.dart';

class IllustrationWidget extends StatelessWidget {
  const IllustrationWidget({
    Key? key,
    required this.illustration,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final Widget illustration;
  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LimitedBox(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
            child: illustration,
          ),
          const SpacingVertical.spacing20(),
          TextWidget.displayXxlBold(
            text: title,
            textAlign: TextAlign.center,
            style: primaryModuleStyle.textModuleStyleWithPrimaryColor(context),
          ),
          if (subTitle != null) ...[
            const SpacingVertical.spacing04(),
            TextWidget.textLgNormal(
              text: subTitle!,
              textAlign: TextAlign.center,
              style:
                  primaryModuleStyle.textModuleStyleWithPrimaryColor(context),
            ),
          ]
        ],
      ),
    );
  }
}
