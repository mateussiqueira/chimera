import 'package:design_system/design_system.dart';

class PrimaryAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  PrimaryAppBarWidget({
    super.key,
    required this.title,
    this.bottom,
    double? height,
    this.hasCustomLeading = true,
    this.style,
  }) : height = height ??
            (bottom != null
                ? kToolbarHeight + bottom.preferredSize.height
                : kToolbarHeight);

  final String title;
  final double height;
  final PreferredSize? bottom;
  final bool hasCustomLeading;
  final AppBarStyle? style;

  AppBarStyle getStyle(BuildContext context) {
    final resolvedStyle = context.resolveStyle<AppBarStyle>();
    return style ?? resolvedStyle ?? AppBarStyle.light;
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    SecondaryModuleStyle? resolvedStyle = secondaryModuleStyle;
    final appBarStyle = getStyle(context);
    return AppBarWidget(
      title: TextWidget.displayMdBold(
        text: title,
        style: TextStyle(
          color: appBarStyle.primaryTextColor ??
              resolvedStyle.textModulePrimaryColor(context),
        ),
      ),
      backgroundColor: appBarStyle.primaryBackgroundColor ??
          resolvedStyle.backgroundModulePrimaryColor(context),
      titleColor: appBarStyle.primaryTextColor ??
          resolvedStyle.textModulePrimaryColor(context),
      bottom: bottom,
      customLeading: hasCustomLeading
          ? const ImageWidget(
              image: Images.appbarIcon,
            )
          : null,
      statusBarTheme: StatusBarTheme.dark,
    );
  }
}
