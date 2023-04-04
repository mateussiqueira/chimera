import 'package:design_system/design_system.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.borderRadius,
    this.border,
    this.padding,
  }) : super(key: key);

  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Border? border;
  final EdgeInsets? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: Sizes.size08,
            vertical: Sizes.size02,
          ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.circular(Sizes.size16),
        border: border,
      ),
      child: child,
    );
  }
}
