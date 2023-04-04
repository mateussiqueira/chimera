import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:certificates/certificates.dart';
import 'package:profile/src/ui/pages/my_certificates/widgets/widgets.dart';
import 'package:profile/src/ui/styles/profile_module_style.dart';

class CertificateWidget extends StatelessWidget {
  const CertificateWidget(
      {super.key,
      required this.certificate,
      this.columns = 1,
      this.crossAxisSpacing = 0,
      this.padding = 0,
      this.contentWidth});

  final CertificateEntity certificate;
  final maxLines = 2;
  final int columns;
  final double crossAxisSpacing;
  final double padding;
  final double? contentWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: moduleStyle.primary.backgroundModuleSecondaryColor(context),
      child: Stack(
        children: [
          const Positioned(
            bottom: Sizes.size00,
            left: Sizes.size00,
            child: ImageWidget(
              image: Images.certificateBottomLeft,
              fit: BoxFit.fitWidth,
            ),
          ),
          const Positioned(
            top: Sizes.size00,
            right: Sizes.size00,
            child: ImageWidget(
              image: Images.certificateTopRight,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            width: Sizes.sizeInfinity,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size08,
              vertical: verticalPadding(context),
            ),
            margin: const EdgeInsets.all(Sizes.size08),
            decoration: BoxDecoration(
              border: Border.all(
                color: context.resolveStyle<CertificateStyle>()?.borderColor ??
                    moduleStyle.quaternary.textModulePrimaryColor(context) ??
                    Colors.transparent,
                width: Sizes.size01,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icons.certificate01.iconCopyWith(
                  color: moduleStyle.primary.textModuleSecondaryColor(context),
                ),
                const SpacingVertical.spacing04(),
                SizedBox(
                  height: certificateNameTextHeight(context),
                  child: Center(
                    child: certificateName(context),
                  ),
                ),
                const SpacingVertical.spacing08(),
                TextWidget.textXsNormal(
                  textAlign: TextAlign.center,
                  text: issuedText,
                  style: moduleStyle.primary
                      .textModuleStyleWithSecondaryColor(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String get issuedText {
    return '${R.string.issuedIn} ${certificate.completedAt?.day}/${certificate.completedAt?.month}/${certificate.completedAt?.year}';
  }

  Widget certificateName(BuildContext context) {
    return TextWidget.displayMdBold(
      text: certificate.courseName ?? '',
      style: moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
      textAlign: TextAlign.center,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }

  double certificateNameTextHeight(BuildContext context) {
    return TextWidget.lineHeight(
            style: TypographyDisplayMd.bold(context), context: context) *
        maxLines;
  }

  double verticalPadding(BuildContext context) {
    // vertical
    const cardVerticalMargin = Sizes.size08 * 2;
    const iconHeight = Sizes.size24;
    const iconVerticalSpacing = Sizes.size04;
    final nameTextHeight = certificateNameTextHeight(context);
    const nameVerticalSpacing = Sizes.size08;
    final issuedTextHeight = TextWidget.calculateTextSize(
            text: issuedText,
            style: TypographyTextXl.normal(context),
            context: context)
        .height;
    final totalHeight = cardVerticalMargin +
        iconHeight +
        iconVerticalSpacing +
        nameTextHeight +
        nameVerticalSpacing +
        issuedTextHeight;

    // horizontal
    double cardWidth =
        contentWidth ?? (MediaQuery.of(context).size.width - 2 * padding);
    cardWidth = (cardWidth - ((columns - 1) * crossAxisSpacing)) / columns;

    final fillHeight = (cardWidth / 1.84) - totalHeight;
    if (fillHeight > 0) return fillHeight / 2;
    return Sizes.size08;
  }
}
