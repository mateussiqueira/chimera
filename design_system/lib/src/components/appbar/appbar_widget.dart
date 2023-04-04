import 'package:design_system/design_system.dart';
import 'package:flutter/services.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    Key? key,
    required this.title,
    this.bottom,
    double? height,
    this.actions,
    this.backgroundColor,
    this.customLeading,
    this.titleColor,
    this.statusBarTheme = StatusBarTheme.light,
  })  : height = height ??
            (bottom != null
                ? kToolbarHeight + bottom.preferredSize.height
                : kToolbarHeight),
        super(key: key);

  final Widget title;
  final double height;
  final PreferredSize? bottom;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? titleColor;
  final Widget? customLeading;
  final StatusBarTheme statusBarTheme;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      centerTitle: true,
      elevation: 0,
      backgroundColor: backgroundColor,
      foregroundColor: titleColor,
      title: title,
      bottom: bottom ??
          const PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: EmptyWidget(),
          ),
      leading: customLeading ?? _defaultLeading(context),
      leadingWidth: 40,
      titleSpacing: 0,
      actions: actions,
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        statusBarIconBrightness:
            statusBarTheme.isLight ? Brightness.dark : Brightness.light,
        statusBarBrightness:
            statusBarTheme.isLight ? Brightness.light : Brightness.dark,
      ),
    );
  }

  Widget? _defaultLeading(BuildContext context) {
    final ScaffoldState? scaffold = Scaffold.maybeOf(context);
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
    final bool canPop = parentRoute?.canPop ?? false;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;
    if ((!hasDrawer && !hasEndDrawer && canPop) ||
        (parentRoute?.impliesAppBarDismissal ?? false)) {
      return useCloseButton
          ? const CloseButton()
          : BackButtonWidget(iconColor: titleColor);
    }
    return null;
  }
}
