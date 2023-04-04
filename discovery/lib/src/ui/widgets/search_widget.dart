import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/ui/styles/discovery_module_style.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    Key? key,
    this.autofocus = false,
    this.value,
    this.onValueChange,
    this.onSearchPressed,
  }) : super(key: key);

  final bool autofocus;
  final String? value;
  final Function(String)? onValueChange;
  final VoidCallback? onSearchPressed;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.value ?? '');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SearchWidget oldWidget) {
    if (oldWidget.value != widget.value) {
      final value = widget.value ?? '';
      _controller.value = TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InputBaseWidget(
            controller: _controller,
            height: Sizes.size40,
            placeHolder: R.string.searchACourse,
            autofocus: widget.autofocus,
            onChanged: widget.onValueChange,
            trailingIcon: _enableClearButton
                ? GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => _clear(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Icons.xClose.iconCopyWith(
                            color: moduleStyle.secondary
                                .textModuleTertiaryColor(context),
                            width: Sizes.size16,
                            height: Sizes.size16,
                          ),
                        ),
                      ],
                    ),
                  )
                : null,
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (value) => widget.onSearchPressed?.call(),
          ),
        ),
        const SpacingHorizontal.spacing08(),
        PrimaryButton.iconMd(
          icon: Icons.searchMd,
          onPressed: widget.onSearchPressed,
        ),
      ],
    );
  }

  void _clear() {
    _controller.clear();
    widget.onValueChange?.call('');
    widget.onSearchPressed?.call();
  }

  bool get _enableClearButton => _controller.text.isNotEmpty;
}
