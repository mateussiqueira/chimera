import 'package:design_system/design_system.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.child,
    this.style,
    this.width,
    this.height,
  }) : super(key: key);

  final Widget child;
  final double? width;
  final double? height;
  final CardStyle? style;

  CardStyle getStyle(BuildContext context) {
    final resolvedStyle = context.resolveStyle<CardStyle>();
    return style ?? resolvedStyle ?? CardStyle.light;
  }

  @override
  Widget build(BuildContext context) {
    PrimaryModuleStyle? resolvedStyle = primaryModuleStyle;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: getStyle(context).backgroundColor ??
            resolvedStyle.backgroundModuleSecondaryColor(context),
        boxShadow: getStyle(context).shadow,
        borderRadius: getStyle(context).borderRadius,
      ),
      padding: getStyle(context).padding,
      child: child,
    );
  }
}
