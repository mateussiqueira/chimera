import 'package:design_system/design_system.dart';

class TypographyList {
  static const List<TextWidget> textXs = [
    TextWidget.textXsNormal(text: 'TextXs Normal'),
    TextWidget.textXsMedium(text: 'TextXs Medium'),
    TextWidget.textXsSemiBold(text: 'TextXs SemiBold'),
    TextWidget.textXsBold(text: 'TextXs Bold'),
  ];

  static const List<TextWidget> textSm = [
    TextWidget.textSmNormal(text: 'TextSm Normal'),
    TextWidget.textSmMedium(text: 'TextSm Medium'),
    TextWidget.textSmSemiBold(text: 'TextSm SemiBold'),
    TextWidget.textSmBold(text: 'TextSm Bold'),
  ];

  static const List<TextWidget> textMd = [
    TextWidget.textMdNormal(text: 'TextMd Normal'),
    TextWidget.textMdMedium(text: 'TextMd Medium'),
    TextWidget.textMdSemiBold(text: 'TextMd SemiBold'),
    TextWidget.textMdBold(text: 'TextMd Bold'),
  ];

  static const List<TextWidget> textLg = [
    TextWidget.textLgNormal(text: 'TextLg Normal'),
    TextWidget.textLgMedium(text: 'TextLg Medium'),
    TextWidget.textLgSemiBold(text: 'TextLg SemiBold'),
    TextWidget.textLgBold(text: 'TextLg Bold'),
  ];

  static const List<TextWidget> textXl = [
    TextWidget.textXlNormal(text: 'TextXl Normal'),
    TextWidget.textXlMedium(text: 'TextXl Medium'),
    TextWidget.textXlSemiBold(text: 'TextXl SemiBold'),
    TextWidget.textXlBold(text: 'TextXl Bold'),
  ];

  static const List<TextWidget> displayMd = [
    TextWidget.displayMdNormal(text: 'DisplayMd Normal'),
    TextWidget.displayMdMedium(text: 'DisplayMd Medium'),
    TextWidget.displayMdSemiBold(text: 'DisplayMd SemiBold'),
    TextWidget.displayMdBold(text: 'DisplayMd Bold'),
  ];

  static const List<TextWidget> displayLg = [
    TextWidget.displayLgNormal(text: 'DisplayLg Normal'),
    TextWidget.displayLgMedium(text: 'DisplayLg Medium'),
    TextWidget.displayLgSemiBold(text: 'DisplayLg SemiBold'),
    TextWidget.displayLgBold(text: 'DisplayLg Bold'),
  ];

  static const List<TextWidget> displayXxl = [
    TextWidget.displayXxlNormal(text: 'Display2xl Normal'),
    TextWidget.displayXxlNormal(text: 'Display2xl Medium'),
    TextWidget.displayXxlNormal(text: 'Display2xl SemiBold'),
    TextWidget.displayXxlNormal(text: 'Display2xl Bold'),
  ];

  static final List<TextWidget> allStyles = textXs +
      textSm +
      textMd +
      textLg +
      textXl +
      displayMd +
      displayLg +
      displayXxl;
}
