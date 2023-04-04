import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/styles/learning_module_style.dart';

class QuestionNavigationItem extends StatelessWidget {
  const QuestionNavigationItem({
    Key? key,
    required this.child,
    required this.isSelected,
    required this.itemCompleted,
    required this.hasCompleted,
    required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final bool isSelected;
  final bool itemCompleted;
  final bool hasCompleted;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: Sizes.size40,
        height: Sizes.size40,
        decoration: BoxDecoration(
          color: isSelected
              ? moduleStyle.tertiary.backgroundModuleSecondaryColor(context)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              child,
              if (itemCompleted)
                Container(
                  width: Sizes.size06,
                  height: Sizes.size06,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? moduleStyle.tertiary
                            .backgroundModuleTertiaryColor(context)
                        : moduleStyle.tertiary
                            .backgroundModuleSecondaryColor(context),
                    shape: BoxShape.circle,
                  ),
                )
              else if (hasCompleted)
                const SizedBox(height: Sizes.size06),
            ],
          ),
        ),
      ),
    );
  }
}
