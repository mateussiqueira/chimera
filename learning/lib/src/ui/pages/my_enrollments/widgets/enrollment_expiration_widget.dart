import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/styles/learning_module_style.dart';

import 'enrollment_expiration_style.dart';

class EnrollmentExpirationWidget extends StatelessWidget {
  const EnrollmentExpirationWidget({
    Key? key,
    required this.expireDate,
  }) : super(key: key);

  final DateTime expireDate;

  EnrollmentExpirationStyle? getStyle(BuildContext context) {
    return context.resolveStyle<EnrollmentExpirationStyle>();
  }

  @override
  Widget build(BuildContext context) {
    return BadgeWidget(
      backgroundColor: isExpiring
          ? getStyle(context)?.expiringBackgroundColor ??
              moduleStyle.danger.backgroundModulePrimaryColor(context)
          : getStyle(context)?.backgroundColor ??
              moduleStyle.quaternary.backgroundModulePrimaryColor(context),
      child: TextWidget.textXsMedium(
        text: isExpiring
            ? R.string.daysRemaining(expireDate)
            : R.string.accessUntil(expireDate),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isExpiring
              ? getStyle(context)?.expiringTextColor ??
                  moduleStyle.danger.textModulePrimaryColor(context)
              : getStyle(context)?.textColor ??
                  moduleStyle.quaternary.textModulePrimaryColor(context),
        ),
      ),
    );
  }

  bool get isExpiring => expireDate.daysRemaining <= 30;
}
