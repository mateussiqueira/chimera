import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../../styles/learning_module_style.dart';

class MarkAsCompletedButton extends StatelessWidget {
  const MarkAsCompletedButton({
    Key? key,
    required this.onPressed,
    required this.isCompleted,
  }) : super(key: key);

  final VoidCallback onPressed;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return TextButtonWidget(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icons.checkCircle.iconCopyWith(
            color: isCompleted
                ? moduleStyle.success.textModulePrimaryColor(context)
                : moduleStyle.primary.textModuleTertiaryColor(context),
          ),
          const SpacingHorizontal.spacing12(),
          TextWidget.textMdNormal(
            text: isCompleted
                ? R.string.markAsUncompleted
                : R.string.markAsCompleted,
            style: TextStyle(
              color: isCompleted
                  ? moduleStyle.success.textModulePrimaryColor(context)
                  : moduleStyle.primary.textModulePrimaryColor(context),
            ),
          ),
        ],
      ),
    );
  }
}
