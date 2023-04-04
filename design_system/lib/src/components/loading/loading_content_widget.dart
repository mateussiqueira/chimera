import '../../../design_system.dart';

class LoadingContentWidget extends StatelessWidget {
  const LoadingContentWidget({super.key, this.style});

  final LoadingStyle? style;

  LoadingStyle getStyle(BuildContext context) {
    final resolvedStyle = context.resolveStyle<LoadingStyle>();
    return style ?? resolvedStyle ?? LoadingStyle.light;
  }

  @override
  Widget build(BuildContext context) {
    BaseModuleStyle? resolvedStyle = primaryModuleStyle;
    BaseModuleStyle complementaryStyle = tertiaryModuleStyle;
    return Container(
      decoration: BoxDecoration(
        color: getStyle(context).backgroundColor ??
            resolvedStyle.backgroundModulePrimaryColor(context),
        borderRadius:
            BorderRadius.all(Radius.circular(getStyle(context).contentRadius)),
        boxShadow: Shadows.shadowXs,
      ),
      padding: const EdgeInsets.all(Sizes.size20),
      child: SizedBox(
        width: Sizes.size40,
        height: Sizes.size40,
        child: CircularProgressIndicator(
          strokeWidth: Sizes.size04,
          color: getStyle(context).indicatorColor ??
              complementaryStyle.textModulePrimaryColor(context),
        ),
      ),
    );
  }
}
