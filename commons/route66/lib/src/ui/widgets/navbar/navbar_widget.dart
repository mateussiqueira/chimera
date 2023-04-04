import 'package:design_system/design_system.dart';

import '../../styles/route66_module_style.dart';
import 'navbar_controller.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key, required this.controller});

  final NavbarController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.currentIndex,
      builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size12,
          ),
          decoration: BoxDecoration(
            color: moduleStyle.primary.backgroundModuleSecondaryColor(context),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 8,
                spreadRadius: -2,
                color: Color(0xFFe7e8ea),
              ),
              BoxShadow(
                offset: Offset(0, 8),
                blurRadius: 4,
                spreadRadius: -2,
                color: Color(0xFFf1f1f2),
              ),
            ],
          ),
          child: SafeArea(
            child: Theme(
              data: Theme.of(context).copyWith(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor:
                    moduleStyle.primary.backgroundModuleSecondaryColor(context),
                currentIndex: value,
                items: controller.navigationItems,
                onTap: (index) => controller.navigateTo(index),
                selectedLabelStyle: TypographyTextXs.bold(context),
                selectedItemColor: selectedColor(context),
                unselectedLabelStyle: TypographyTextXs.normal(context),
                unselectedItemColor: unselectedColor(context),
                selectedIconTheme: IconThemeData(
                  color: selectedColor(context),
                ),
                unselectedIconTheme: IconThemeData(
                  color: unselectedColor(context),
                ),
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
              ),
            ),
          ),
        );
      },
    );
  }

  Color? unselectedColor(BuildContext context) =>
      moduleStyle.primary.textModuleTertiaryColor(context);
  Color? selectedColor(BuildContext context) =>
      moduleStyle.tertiary.textModulePrimaryColor(context);
}
