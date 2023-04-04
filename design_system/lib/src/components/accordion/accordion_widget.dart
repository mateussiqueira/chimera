import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/accordion/expanded_tile.dart';

class AccordionWidget extends StatefulWidget {
  const AccordionWidget({
    Key? key,
    required this.header,
    required this.body,
    this.expanded = true,
    this.style,
    this.controller,
  }) : super(key: key);

  final Widget header;
  final Widget body;
  final bool expanded;
  final ExpandedTileController? controller;
  final AccordionStyle? style;

  @override
  AccordionWidgetState createState() => AccordionWidgetState();
}

class AccordionWidgetState extends State<AccordionWidget> {
  late ExpandedTileController _controller;

  @override
  void initState() {
    _controller = widget.controller ??
        ExpandedTileController(
          isExpanded: widget.expanded,
        );
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  AccordionStyle get style {
    final resolvedStyle = context.resolveStyle<AccordionStyle>();
    return widget.style ?? resolvedStyle ?? AccordionStyle.light;
  }

  @override
  Widget build(BuildContext context) {
    PrimaryModuleStyle? resolvedStyle = primaryModuleStyle;
    return ExpandedTile(
      contentSeperator: 0,
      theme: ExpandedTileThemeData(
        headerColor: style.backgroundColor ??
            resolvedStyle.backgroundModuleSecondaryColor(context),
        headerRadius: _headerRadius(context),
        contentRadius: style.contentRadius,
        contentBackgroundColor: style.contentBackgroundColor ??
            resolvedStyle.backgroundModuleSecondaryColor(context),
        contentPadding: EdgeInsets.zero,
        titlePadding: const EdgeInsets.fromLTRB(
          Sizes.size16,
          Sizes.size12,
          Sizes.size08,
          Sizes.size12,
        ),
        headerPadding: EdgeInsets.zero,
        leadingPadding: EdgeInsets.zero,
        trailingPadding: _controller.isExpanded
            ? const EdgeInsets.only(left: Sizes.size12)
            : const EdgeInsets.only(right: Sizes.size12),
      ),
      title: widget.header,
      content: widget.body,
      controller: _controller,
      trailing: style.chevronIcon?.iconCopyWith(
        color: style.chevronIconColor ??
            resolvedStyle.textModulePrimaryColor(
              context,
            ),
      ),
      trailingRotation: -180,
      boxShadow: style.boxShadow,
    );
  }

  BorderRadius? _headerRadius(BuildContext context) {
    if (_controller.isExpanded) {
      return style.headerExpandedRadius;
    }
    return style.headerRadius;
  }
}
