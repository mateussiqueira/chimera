import 'package:design_system/design_system.dart';

class ToastContentWidget extends StatelessWidget {
  const ToastContentWidget({
    super.key,
    this.icon,
    this.style,
    required this.text,
    required this.toastType,
  });

  final Widget? icon;
  final ToastStyle? style;
  final String text;
  final ToastType toastType;

  @override
  Widget build(BuildContext context) {
    BaseModuleStyle? resolvedStyle = secondaryModuleStyle;
    return Container(
      width: Sizes.sizeInfinity,
      margin: const EdgeInsets.symmetric(
        vertical: Sizes.size16,
        horizontal: Sizes.size16,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size16,
        horizontal: Sizes.size16,
      ),
      decoration: BoxDecoration(
        color: getBackgroundColor(context),
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizes.size08),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [icon!, const SpacingHorizontal.spacing12()],
            ),
          Expanded(
            child: TextWidget.textSmNormal(
              text: text,
              style: TextStyle(
                color: resolvedStyle.textModulePrimaryColor(context),
              ),
            ),
          )
        ],
      ),
    );
  }

  Color? getBackgroundColor(BuildContext context) {
    final resolvedStyle = context.resolveStyle<ToastStyle>();
    if (toastType == ToastType.error) {
      BaseModuleStyle? dangerModule = dangerModuleStyle;
      return style?.backgroundErrorColor ??
          resolvedStyle?.backgroundErrorColor ??
          dangerModule.textModulePrimaryColor(context);
    }
    if (toastType == ToastType.success) {
      BaseModuleStyle? successModule = successModuleStyle;
      return style?.backgroundSuccessColor ??
          resolvedStyle?.backgroundSuccessColor ??
          successModule.textModulePrimaryColor(context);
    }
    BaseModuleStyle? moduleStyle = tertiaryModuleStyle;
    return style?.backgroundInfoColor ??
        resolvedStyle?.backgroundInfoColor ??
        moduleStyle.textModulePrimaryColor(context);
  }
}
