import 'package:design_system/design_system.dart';

class SecondaryAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  SecondaryAppBarWidget({
    super.key,
    required this.title,
    this.bottom,
    double? height,
    this.actions,
    this.style,
  }) : height = height ??
            (bottom != null
                ? kToolbarHeight + bottom.preferredSize.height
                : kToolbarHeight);

  final String title;
  final double height;
  final PreferredSize? bottom;
  final List<Widget>? actions;
  final AppBarStyle? style;

  AppBarStyle getStyle(BuildContext context) {
    final resolvedStyle = context.resolveStyle<AppBarStyle>();
    return style ?? resolvedStyle ?? AppBarStyle.light;
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    PrimaryModuleStyle? resolvedStyle = primaryModuleStyle;
    final appBarStyle = getStyle(context);
    return AppBarWidget(
      title: TextWidget.textMdNormal(
        text: title,
        style: TextStyle(
          color: appBarStyle.primaryTextColor ??
              resolvedStyle.textModulePrimaryColor(context),
        ),
      ),
      customLeading: const BackButtonWidget(),
      backgroundColor: appBarStyle.primaryBackgroundColor ??
          resolvedStyle.backgroundModulePrimaryColor(context),
      titleColor: appBarStyle.primaryTextColor ??
          resolvedStyle.textModulePrimaryColor(context),
      actions: actions,
      statusBarTheme: StatusBarTheme.light,
    );
  }
}
