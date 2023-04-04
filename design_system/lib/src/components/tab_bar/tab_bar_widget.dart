import 'package:design_system/design_system.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    Key? key,
    required this.tabs,
    this.style,
  }) : super(key: key);

  final List<Widget> tabs;
  final TabBarStyle? style;

  TabBarStyle getStyle(BuildContext context) {
    final resolvedStyle = context.resolveStyle<TabBarStyle>();
    return style ?? resolvedStyle ?? TabBarStyle.light(context);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: tabs,
      indicatorColor:
          getStyle(context).indicatorColor ?? selectedColor(context),
      labelColor: getStyle(context).labelColor ?? selectedColor(context),
      unselectedLabelColor:
          getStyle(context).unselectedLabelColor ?? unselectedColor(context),
      labelStyle: getStyle(context).labelStyle,
      unselectedLabelStyle: getStyle(context).unselectedLabelStyle,
      indicatorWeight: Sizes.size02,
    );
  }

  Color? unselectedColor(BuildContext context) =>
      primaryModuleStyle.textModuleSecondaryColor(context);
  Color? selectedColor(BuildContext context) =>
      tertiaryModuleStyle.textModulePrimaryColor(context);
}
