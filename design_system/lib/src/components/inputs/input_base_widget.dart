import 'package:design_system/design_system.dart';

class InputBaseWidget extends StatelessWidget {
  const InputBaseWidget({
    this.autofocus = false,
    this.autocorrect = true,
    this.disabled = false,
    this.enableSuggestions = true,
    this.errorText,
    this.height,
    this.helperText,
    super.key,
    this.leadingIcon,
    this.maxLength,
    this.maxLines = 1,
    this.obscureText = false,
    this.onChanged,
    this.onFocusChange,
    this.placeHolder,
    this.style,
    this.titleText,
    this.trailingIcon,
    this.trailingErrorIcon,
    this.textCapitalization = TextCapitalization.none,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.value,
    this.controller,
    this.forceTrim = true,
    this.radius,
  });

  final bool autofocus;
  final bool autocorrect;
  final bool disabled;
  final bool enableSuggestions;
  final bool forceTrim;
  final String? errorText;
  final double? height;
  final String? helperText;
  final Widget? leadingIcon;
  final int? maxLength;
  final int maxLines;
  final double? radius;

  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? onFocusChange;
  final String? placeHolder;
  final InputBaseStyle? style;
  final String? titleText;
  final Widget? trailingIcon;
  final Widget? trailingErrorIcon;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final ValueChanged<String>? onFieldSubmitted;
  final String? value;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleText != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget.textSmMedium(
                text: titleText!,
                style: TextStyle(
                  color: titleTextColor(context),
                ),
              ),
              const SpacingVertical.spacing08()
            ],
          ),
        Focus(
            onFocusChange: onFocusChange,
            child: SizedBox(
              height: height,
              child: TextFormField(
                controller: controller,
                autofocus: autofocus,
                autocorrect: autocorrect,
                decoration: InputDecoration(
                  enabledBorder: getBorder(
                    context,
                    borderColorDefault(context),
                  ),
                  border: getBorder(
                    context,
                    borderColorDefault(context),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: Spacings.spacing02,
                  ),
                  counterStyle: TypographyTextXs.normal(context).copyWith(
                    color: backgroundColorDefault(context),
                  ),
                  disabledBorder: getBorder(
                    context,
                    borderColorDisabled(context),
                  ),
                  enabled: !disabled,
                  errorBorder: getBorder(
                    context,
                    borderColorError(context),
                  ),
                  errorText: errorText,
                  focusedBorder:
                      getBorder(context, borderColorFocused(context)),
                  hintText: placeHolder,
                  hintStyle: TypographyTextSm.normal(context).copyWith(
                    color: placeholderColor(context),
                  ),
                  filled: true,
                  fillColor: disabled
                      ? backgroundColorDisabled(context)
                      : backgroundColorDefault(context),
                  prefix: Padding(
                    padding: leadingIcon != null
                        ? const EdgeInsets.only(left: Spacings.spacing08)
                        : const EdgeInsets.only(left: Spacings.spacing16),
                  ),
                  prefixIcon: leadingIcon != null
                      ? Padding(
                          padding:
                              const EdgeInsets.only(left: Spacings.spacing16),
                          child: leadingIcon!,
                        )
                      : null,
                  suffixIcon: trailingIcon != null
                      ? Padding(
                          padding:
                              const EdgeInsets.only(right: Spacings.spacing16),
                          child: trailingIcon,
                        )
                      : null,
                ),
                enableSuggestions: enableSuggestions,
                initialValue: value,
                keyboardType: textInputType,
                maxLength: maxLength,
                maxLines: maxLines,
                obscureText: obscureText,
                onChanged: (value) => onChanged?.call(
                  forceTrim ? value.trim() : value,
                ),
                textCapitalization: textCapitalization,
                textInputAction: textInputAction,
                onFieldSubmitted: (value) => onFieldSubmitted?.call(
                  forceTrim ? value.trim() : value,
                ),
                style: TypographyTextMd.normal(context).copyWith(
                  color: textColor(context),
                ),
              ),
            )),
        if (helperText != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SpacingVertical.spacing04(),
              TextWidget.textSmNormal(
                text: helperText!,
                style: TextStyle(
                  color: helperTextDefaultColor(context),
                ),
              ),
            ],
          ),
      ],
    );
  }

  InputBaseStyle getStyle(BuildContext context) {
    final resolvedStyle = context.resolveStyle<InputBaseStyle>();
    return style ?? resolvedStyle ?? InputBaseStyle.light;
  }

  Color? backgroundColorDefault(BuildContext context) =>
      getStyle(context).backgroundColorDefault ??
      primaryModuleStyle.backgroundModuleSecondaryColor(context);
  Color? backgroundColorDisabled(BuildContext context) =>
      getStyle(context).backgroundColorDisabled ??
      primaryModuleStyle.textModulePrimaryColor(context);
  Color? borderColorFocused(BuildContext context) =>
      getStyle(context).borderColorFocused ??
      tertiaryModuleStyle.backgroundModuleTertiaryColor(context);
  Color? borderColorDefault(BuildContext context) =>
      getStyle(context).borderColorDefault ??
      primaryModuleStyle.backgroundModuleTertiaryColor(context);
  Color? borderColorError(BuildContext context) =>
      getStyle(context).borderColorError ??
      dangerModuleStyle.textModulePrimaryColor(context);
  Color? borderColorDisabled(BuildContext context) =>
      getStyle(context).borderColorDisabled ??
      primaryModuleStyle.textModulePrimaryColor(context);
  Color? helperTextDefaultColor(BuildContext context) =>
      getStyle(context).helperTextDefaultColor ??
      primaryModuleStyle.textModuleSecondaryColor(context);
  Color? helperTextErrorColor(BuildContext context) =>
      getStyle(context).helperTextErrorColor ??
      dangerModuleStyle.textModulePrimaryColor(context);
  Color? placeholderColor(BuildContext context) =>
      getStyle(context).placeholderColor ??
      primaryModuleStyle.textModuleTertiaryColor(context);
  Color? textColor(BuildContext context) =>
      getStyle(context).textColor ??
      primaryModuleStyle.textModulePrimaryColor(context);
  Color? titleTextColor(BuildContext context) =>
      getStyle(context).titleTextColor ??
      primaryModuleStyle.textModulePrimaryColor(context);

  OutlineInputBorder getBorder(BuildContext context, Color? color) {
    return OutlineInputBorder(
      borderRadius: _borderRadius ??
          getStyle(context).borderRadius ??
          InputBaseStyle.defaultBorderRadius,
      borderSide: BorderSide(
        color: color ?? Colors.transparent,
        width:
            getStyle(context).borderWidth ?? InputBaseStyle.defaultBorderWidth,
      ),
    );
  }

  BorderRadius? get _borderRadius {
    return radius != null ? BorderRadius.circular(radius ?? 0) : null;
  }

  static Icons _getEyeIcon(bool obscure) => obscure ? Icons.eyeOff : Icons.eye;

  static Widget getEyeWidget({
    required BuildContext context,
    required bool obscure,
    required bool hasError,
    InputBaseStyle? style,
    final VoidCallback? onPressed,
  }) {
    BaseModuleStyle? resolvedStyle = primaryModuleStyle;
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: Sizes.size12,
        height: Sizes.size12,
        child: Center(
          child: _getEyeIcon(obscure).iconCopyWith(
            color: resolvedStyle.textModulePrimaryColor(context),
          ),
        ),
      ),
    );
  }

  static Widget alertWidget({required BuildContext context, Color? iconColor}) {
    return SizedBox(
      width: Sizes.size12,
      height: Sizes.size12,
      child: Icons.alertCircle.iconCopyWith(color: iconColor),
    );
  }
}
