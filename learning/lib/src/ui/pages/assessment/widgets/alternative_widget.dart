import 'package:design_system/design_system.dart';

import '../../../styles/learning_module_style.dart';
import '../alternative_enum.dart';

class AlternativeWidget extends StatelessWidget {
  const AlternativeWidget({
    super.key,
    required this.letter,
    required this.onPressed,
    required this.statement,
    required this.status,
  });

  static final List<String> alternativesLetters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  final String letter;
  final String statement;
  final AlternativeEnum status;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(Sizes.size08),
        decoration: BoxDecoration(
          color: getAlternativeBackgroundColor(context),
          borderRadius: BorderRadius.circular(Sizes.size16),
          border: Border.all(
              color: getAlternativeBorderColor(context) ?? Colors.transparent,
              width: 1),
        ),
        child: Row(children: [
          Container(
            width: Sizes.size32,
            height: Sizes.size32,
            decoration: BoxDecoration(
              color: getAlternativeLetterBackgroundColor(context),
              borderRadius: BorderRadius.circular(Sizes.size16),
            ),
            child: Center(
              child: getAlternativeLetter(context),
            ),
          ),
          const SpacingHorizontal.spacing12(),
          Expanded(
            child: HtmlRenderWidget(
              html: getAlHtmlStatement(),
            ),
          )
        ]),
      ),
    );
  }

  String getAlHtmlStatement() {
    return '''<div style="font-family: 'Inter'; font-style: normal; font-weight: 400; font-size: 14px; line-height: 20px; color: #344054;">$statement</div>''';
  }

  Color? getAlternativeBackgroundColor(BuildContext context) {
    switch (status) {
      case AlternativeEnum.notSelected:
        return moduleStyle.tertiary.backgroundModulePrimaryColor(context);
      case AlternativeEnum.selected:
        return moduleStyle.tertiary.backgroundModuleSecondaryColor(context);
      case AlternativeEnum.correct:
        return moduleStyle.success.backgroundModulePrimaryColor(context);
      case AlternativeEnum.wrong:
        return moduleStyle.danger.backgroundModulePrimaryColor(context);
    }
  }

  Color? getAlternativeLetterBackgroundColor(BuildContext context) {
    switch (status) {
      case AlternativeEnum.notSelected:
      case AlternativeEnum.selected:
        return moduleStyle.primary.backgroundModulePrimaryColor(context);
      case AlternativeEnum.correct:
        return moduleStyle.success.backgroundModuleTertiaryColor(context);
      case AlternativeEnum.wrong:
        return moduleStyle.danger.backgroundModuleTertiaryColor(context);
    }
  }

  Color? getAlternativeBorderColor(BuildContext context) {
    switch (status) {
      case AlternativeEnum.notSelected:
        return moduleStyle.tertiary.backgroundModulePrimaryColor(context);
      case AlternativeEnum.selected:
        return moduleStyle.tertiary.backgroundModuleSecondaryColor(context);
      case AlternativeEnum.correct:
        return moduleStyle.success.textModulePrimaryColor(context);
      case AlternativeEnum.wrong:
        return moduleStyle.danger.textModulePrimaryColor(context);
    }
  }

  Widget getAlternativeLetter(BuildContext context) {
    switch (status) {
      case AlternativeEnum.notSelected:
      case AlternativeEnum.selected:
        return TextWidget.displayMdMedium(
          text: letter,
          style: moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
        );
      case AlternativeEnum.correct:
        return SizedBox(
          width: Sizes.size20,
          child: Icons.check.iconCopyWith(
            color: moduleStyle.success.textModulePrimaryColor(context),
          ),
        );
      case AlternativeEnum.wrong:
        return SizedBox(
          width: Sizes.size20,
          child: Icons.xClose.iconCopyWith(
            color: moduleStyle.danger.textModulePrimaryColor(context),
          ),
        );
    }
  }
}
