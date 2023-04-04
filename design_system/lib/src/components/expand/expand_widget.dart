import 'package:design_system/design_system.dart';

class ExpandWidget extends StatefulWidget {
  const ExpandWidget({
    Key? key,
    this.expanded = false,
    required this.child,
    required this.expandText,
    required this.retractText,
    this.collapsedHeight = Sizes.size100,
  }) : super(key: key);

  final bool expanded;
  final Widget child;
  final double collapsedHeight;
  final String expandText;
  final String retractText;

  @override
  State<ExpandWidget> createState() => _ExpandWidgetState();
}

class _ExpandWidgetState extends State<ExpandWidget> {
  bool isExpanded = false;
  bool? canExpand;

  @override
  void initState() {
    isExpanded = widget.expanded;
    super.initState();
  }

  BaseModuleStyle? moduleStyle(BuildContext context) {
    return primaryModuleStyle;
  }

  Color background(BuildContext context) {
    return moduleStyle(context)?.backgroundModulePrimaryColor(context) ??
        Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    final widgetSize = WidgetSize(
      onChange: (size) => _verifyCanExpand(size),
      child: widget.child,
    );
    if (canExpand == null) {
      return widgetSize;
    } else if (canExpand == false) {
      return widget.child;
    }
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: !isExpanded ? widget.collapsedHeight : null,
              child: widget.child,
            ),
            if (!isExpanded) ...[
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: const [0, 1],
                      colors: [
                        background(context),
                        background(context).withOpacity(0.1),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
        if (isExpanded) ...[
          const SpacingVertical.spacing12(),
          _retractButton,
        ] else
          _expandButton
      ],
    );
  }

  Widget get _expandButton {
    return GestureDetector(
      onTap: () {
        _updateExpanded(true);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget.textSmMedium(
            text: widget.expandText,
            style:
                moduleStyle(context)?.textModuleStyleWithPrimaryColor(context),
          ),
          const SpacingHorizontal.spacing08(),
          Icons.chevronDown.iconCopyWith(
            color: moduleStyle(context)?.textModulePrimaryColor(context),
          )
        ],
      ),
    );
  }

  Widget get _retractButton {
    return GestureDetector(
      onTap: () {
        _updateExpanded(false);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget.textSmMedium(
            text: widget.retractText,
            style:
                moduleStyle(context)?.textModuleStyleWithPrimaryColor(context),
          ),
          const SpacingHorizontal.spacing08(),
          Icons.chevronUp.iconCopyWith(
            color: moduleStyle(context)?.textModulePrimaryColor(context),
          )
        ],
      ),
    );
  }

  void _updateExpanded(bool value) {
    if (mounted) {
      setState(() {
        isExpanded = value;
      });
    }
  }

  void _verifyCanExpand(Size size) {
    if (size.height <= widget.collapsedHeight) {
      _updateCanExpand(false);
    } else {
      _updateCanExpand(true);
    }
  }

  void _updateCanExpand(bool value) {
    if (mounted) {
      setState(() {
        canExpand = value;
      });
    }
  }
}
