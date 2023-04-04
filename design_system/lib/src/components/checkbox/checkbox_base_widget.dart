import 'package:design_system/design_system.dart';

class CheckboxBaseWidget extends StatelessWidget {
  final bool checked;
  final bool disabled;
  final VoidCallback? onPressed;
  final CheckboxBaseStyle? style;
  final CheckboxSize checkboxSize;
  final CheckboxType checkboxType;

  const CheckboxBaseWidget({
    super.key,
    required this.checked,
    this.disabled = false,
    this.onPressed,
    this.style,
    this.checkboxSize = CheckboxSize.sizeSm,
    this.checkboxType = CheckboxType.checkbox,
  });

  const CheckboxBaseWidget.radioButtonSm({
    super.key,
    required this.checked,
    this.disabled = false,
    this.onPressed,
    this.style,
    this.checkboxSize = CheckboxSize.sizeSm,
    this.checkboxType = CheckboxType.radioButton,
  });

  const CheckboxBaseWidget.radioButtonMd({
    super.key,
    required this.checked,
    this.disabled = false,
    this.onPressed,
    this.style,
    this.checkboxSize = CheckboxSize.sizeMd,
    this.checkboxType = CheckboxType.radioButton,
  });

  const CheckboxBaseWidget.checkboxSm({
    super.key,
    required this.checked,
    this.disabled = false,
    this.onPressed,
    this.style,
    this.checkboxSize = CheckboxSize.sizeSm,
    this.checkboxType = CheckboxType.checkbox,
  });

  const CheckboxBaseWidget.checkboxMd({
    super.key,
    required this.checked,
    this.disabled = false,
    this.onPressed,
    this.style,
    this.checkboxSize = CheckboxSize.sizeMd,
    this.checkboxType = CheckboxType.checkbox,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: checkboxSize.size,
      height: checkboxSize.size,
      child: GestureDetector(
        onTap: disabled ? null : onPressed,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: getBorderColor(context), width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(getContainerRadius()),
            ),
            color: getBackgroundColor(context),
          ),
          child: getIcon(context),
        ),
      ),
    );
  }

  double getContainerRadius() {
    if (checkboxType == CheckboxType.radioButton) {
      if (checkboxSize == CheckboxSize.sizeSm) {
        return CheckboxBaseStyle.radiusCircleSm;
      }
      return CheckboxBaseStyle.radiusCircleMd;
    }
    if (checkboxSize == CheckboxSize.sizeSm) {
      return CheckboxBaseStyle.radiusCheckboxSm;
    }
    return CheckboxBaseStyle.radiusCheckboxMd;
  }

  CheckboxBaseStyle getStyle(BuildContext context) {
    final resolvedStyle = context.resolveStyle<CheckboxBaseStyle>();
    return style ?? resolvedStyle ?? CheckboxBaseStyle.light;
  }

  Color? getBackgroundColor(BuildContext context) {
    if (disabled) {
      PrimaryModuleStyle? resolvedStyle = primaryModuleStyle;
      return getStyle(context).backgroundColorDisabled ??
          resolvedStyle.backgroundModulePrimaryColor(context);
    }
    if (checked) {
      return getStyle(context).backgroundColorChecked ??
          tertiaryModuleStyle.backgroundModulePrimaryColor(context);
    }
    return getStyle(context).backgroundColorDefault ?? Colors.transparent;
  }

  Color getBorderColor(BuildContext context) {
    SecondaryModuleStyle? resolvedStyle = secondaryModuleStyle;
    if (disabled) {
      return getStyle(context).iconDisabledColor ??
          resolvedStyle.textModuleSecondaryColor(context) ??
          Colors.transparent;
    }
    if (checked) {
      return getStyle(context).iconColor ??
          resolvedStyle.backgroundModuleSecondaryColor(context) ??
          Colors.transparent;
    }
    return getStyle(context).borderColorDefault ?? Colors.transparent;
  }

  Widget? getIcon(BuildContext context) {
    if (checked) {
      return Center(
        child: checkboxType == CheckboxType.checkbox
            ? Icons.check.iconCopyWith(color: getBorderColor(context))
            : CheckboxBaseStyle.radioIconCircle(
                color: getBorderColor(context), size: checkboxSize),
      );
    }
    return null;
  }
}
