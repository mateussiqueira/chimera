import 'package:design_system/design_system.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';

class PaginationGridWidget extends StatefulWidget {
  const PaginationGridWidget({
    Key? key,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 24,
    this.mainAxisSpacing = 8,
    required this.itemBuilder,
    required this.itemCount,
    required this.nextPage,
    this.padding,
    this.physics,
    this.scrollController,
    this.shrinkWrap = false,
  }) : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final ScrollController? scrollController;
  final Future<void> Function() nextPage;
  final EdgeInsets? padding;

  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final int crossAxisCount; // columns
  final double mainAxisSpacing; // spacing between rows
  final double crossAxisSpacing; // spacing between columns

  @override
  State<PaginationGridWidget> createState() => _PaginationGridWidgetState();
}

class _PaginationGridWidgetState extends State<PaginationGridWidget> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(() {
      final maxPosition = _scrollController.position.maxScrollExtent;

      if (_scrollController.position.pixels == maxPosition) {
        widget.nextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: DynamicHeightGridView(
        itemCount: widget.itemCount,
        crossAxisCount: widget.crossAxisCount,
        crossAxisSpacing: widget.crossAxisSpacing,
        mainAxisSpacing: widget.mainAxisSpacing,
        builder: widget.itemBuilder,
        controller: _scrollController,
        physics: widget.physics,
        shrinkWrap: widget.shrinkWrap,
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
