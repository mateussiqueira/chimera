import 'package:design_system/design_system.dart';
import 'package:styled_text/styled_text.dart';

class TextWidget extends StatelessWidget {
  const TextWidget.displayXxlNormal({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyDisplayXxl.normal;

  const TextWidget.displayXxlMedium({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyDisplayXxl.medium;

  const TextWidget.displayXxlSemiBold({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyDisplayXxl.semiBold;

  const TextWidget.displayXxlBold({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyDisplayXxl.bold;

  const TextWidget.displayLgNormal({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyDisplayLg.normal;

  const TextWidget.displayLgMedium({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyDisplayLg.medium;

  const TextWidget.displayLgSemiBold({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyDisplayLg.semiBold;

  const TextWidget.displayLgBold({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyDisplayLg.bold;

  const TextWidget.displayMdNormal({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyDisplayMd.normal;

  const TextWidget.displayMdMedium({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyDisplayMd.medium;

  const TextWidget.displayMdSemiBold({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyDisplayMd.semiBold;

  const TextWidget.displayMdBold({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyDisplayMd.bold;

  const TextWidget.textLgNormal({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextLg.normal;

  const TextWidget.textLgMedium({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextLg.medium;

  const TextWidget.textLgSemiBold({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextLg.semiBold;

  const TextWidget.textLgBold({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextLg.bold;

  const TextWidget.textMdNormal({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextMd.normal;

  const TextWidget.textMdMedium({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextMd.medium;

  const TextWidget.textMdSemiBold({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextMd.semiBold;

  const TextWidget.textMdBold({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextMd.bold;

  const TextWidget.textSmNormal({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextSm.normal;

  const TextWidget.textSmMedium({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextSm.medium;

  const TextWidget.textSmSemiBold({
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    super.key,
  }) : _baseStyle = TypographyTextSm.semiBold;

  const TextWidget.textSmBold({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextSm.bold;

  const TextWidget.textXlNormal({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextXl.normal;

  const TextWidget.textXlMedium({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextXl.medium;

  const TextWidget.textXlSemiBold({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextXl.semiBold;

  const TextWidget.textXlBold({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextXl.bold;

  const TextWidget.textXsNormal({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextXs.normal;

  const TextWidget.textXsMedium({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextXs.medium;

  const TextWidget.textXsSemiBold({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextXs.semiBold;

  const TextWidget.textXsBold({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _baseStyle = TypographyTextXs.bold;

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextStyle Function(BuildContext) _baseStyle;

  @override
  Widget build(BuildContext context) {
    return DefaultTextHeightBehavior(
      textHeightBehavior: const TextHeightBehavior(),
      child: StyledText(
        text: text,
        style: _baseStyle(context).merge(style),
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        tags: {
          ...fontWeightTags,
          ...textDecorationTags,
        },
      ),
    );
  }

  Map<String, StyledTextTagBase> get textDecorationTags {
    return <String, StyledTextTagBase>{
      'underline': StyledTextTag(
        style: const TextStyle(decoration: TextDecoration.underline),
      ),
      'overline': StyledTextTag(
        style: const TextStyle(decoration: TextDecoration.overline),
      ),
      'lineThrough': StyledTextTag(
        style: const TextStyle(decoration: TextDecoration.lineThrough),
      ),
    };
  }

  Map<String, StyledTextTagBase> get fontWeightTags {
    return <String, StyledTextTagBase>{
      for (final weight in FontWeight.values)
        fontWeightName(weight): StyledTextTag(
          style: TextStyle(
            fontWeight: weight,
          ),
        ),
    };
  }

  String fontWeightName(FontWeight weight) {
    switch (weight) {
      case FontWeight.w100:
        return 'w100';
      case FontWeight.w200:
        return 'w200';
      case FontWeight.w300:
        return 'w300';
      case FontWeight.w400:
        return 'w400';
      case FontWeight.w500:
        return 'w500';
      case FontWeight.w600:
        return 'w600';
      case FontWeight.w700:
        return 'w700';
      case FontWeight.w800:
        return 'w800';
      case FontWeight.w900:
        return 'w900';
    }
    return 'unknownWeight';
  }

  static Size calculateTextSize({
    required String text,
    required TextStyle style,
    required BuildContext? context,
  }) {
    final double textScaleFactor = context != null
        ? MediaQuery.of(context).textScaleFactor
        : WidgetsBinding.instance.window.textScaleFactor;

    final TextDirection textDirection =
        context != null ? Directionality.of(context) : TextDirection.ltr;

    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: textDirection,
      textScaleFactor: textScaleFactor,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.size;
  }

  static double lineHeight({
    required TextStyle style,
    required BuildContext? context,
  }) {
    return calculateTextSize(text: ' ', style: style, context: context).height;
  }
}
