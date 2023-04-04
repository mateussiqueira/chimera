import '../../../design_system.dart';

class ScaffoldBaseWidget extends StatelessWidget with KeyboardMixin {
  const ScaffoldBaseWidget({
    Key? key,
    this.appBar,
    required this.body,
    this.drawer,
    this.bottomNavigationBar,
    this.minimumBottomPadding,
    this.roundedBottomNavigationBar = true,
    this.resizeToAvoidBottomInset = true,
    this.extendBodyBehindAppBar = false,
    this.forceSafeArea = true,
    this.bottomNavigationBarSafeArea = true,
    this.bottomNavigationWithoutStyle = false,
    this.style,
    this.backgroundColor,
    this.floatActionButton,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final double? minimumBottomPadding;
  final bool roundedBottomNavigationBar;
  final bool resizeToAvoidBottomInset;
  final bool extendBodyBehindAppBar;
  final bool forceSafeArea;
  final bool bottomNavigationBarSafeArea;
  final bool bottomNavigationWithoutStyle;
  final ScaffoldBaseStyle? style;
  final Color? backgroundColor;
  final Widget? floatActionButton;

  ScaffoldBaseStyle getStyle(BuildContext context) {
    final resolvedStyle = context.resolveStyle<ScaffoldBaseStyle>();
    return style ?? resolvedStyle ?? ScaffoldBaseStyle.light;
  }

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = primaryModuleStyle;
    final complementaryResolvedStyle = tertiaryModuleStyle;
    return GestureDetector(
      onTap: () => KeyboardMixin.hideKeyboard(),
      child: Scaffold(
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        backgroundColor: getStyle(context).bodyBackgroundColor ??
            resolvedStyle.backgroundModulePrimaryColor(context),
        appBar: appBar ??
            AppBar(
              backgroundColor: getStyle(context).appBarBackgroundColor ??
                  complementaryResolvedStyle.textModulePrimaryColor(context),
              toolbarHeight: 0,
              elevation: 0,
            ),
        bottomNavigationBar: _bottomNavigationBar(context),
        drawer: drawer,
        body: forceSafeArea
            ? SafeArea(
                child: body,
              )
            : body,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButton: floatActionButton,
      ),
    );
  }

  Widget? _bottomNavigationBar(BuildContext context) {
    if (bottomNavigationWithoutStyle) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.zero,
        ),
        child: bottomNavigationBarSafeArea
            ? SafeArea(
                minimum: EdgeInsets.only(
                  bottom: _minimumBottomSafeArea(context),
                ),
                maintainBottomViewPadding: true,
                child: bottomNavigationBar!,
              )
            : bottomNavigationBar,
      );
    }
    if (bottomNavigationBar != null) {
      final resolvedStyle = tertiaryModuleStyle;
      return Container(
        decoration: BoxDecoration(
          color: getStyle(context).bottomNavigationBarBackgroundColor ??
              resolvedStyle.backgroundModuleSecondaryColor(context),
          borderRadius: roundedBottomNavigationBar
              ? const BorderRadius.only(
                  topLeft: Radius.circular(Spacings.spacing16),
                  topRight: Radius.circular(Spacings.spacing16),
                )
              : BorderRadius.zero,
          boxShadow: Shadows.shadowXs,
        ),
        child: bottomNavigationBarSafeArea
            ? SafeArea(
                minimum: EdgeInsets.only(
                  bottom: _minimumBottomSafeArea(context),
                ),
                maintainBottomViewPadding: true,
                child: bottomNavigationBar!,
              )
            : bottomNavigationBar,
      );
    }

    return null;
  }

  double _minimumBottomSafeArea(context) {
    double minPadding = 0;
    if (resizeToAvoidBottomInset) {
      minPadding += MediaQuery.of(context).viewInsets.bottom;
    }
    minPadding += minimumBottomPadding ?? Spacings.spacing16;
    return minPadding;
  }
}
