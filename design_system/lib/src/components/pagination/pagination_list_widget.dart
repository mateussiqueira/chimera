import 'package:design_system/design_system.dart';

class PaginationListWidget extends StatefulWidget {
  const PaginationListWidget({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    required this.nextPage,
    this.separatorBuilder,
    this.padding,
    this.scrollController,
    this.physics,
    this.shrinkWrap = false,
  }) : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final int itemCount;
  final EdgeInsets? padding;
  final ScrollController? scrollController;
  final Future<void> Function() nextPage;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  @override
  State<PaginationListWidget> createState() => _PaginationListWidgetState();
}

class _PaginationListWidgetState extends State<PaginationListWidget> {
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
    if (widget.separatorBuilder != null) {
      return ListView.separated(
        itemBuilder: widget.itemBuilder,
        separatorBuilder: widget.separatorBuilder!,
        itemCount: widget.itemCount,
        padding: widget.padding,
        controller: _scrollController,
        physics: widget.physics,
        shrinkWrap: widget.shrinkWrap,
      );
    }
    return ListView.builder(
      itemBuilder: widget.itemBuilder,
      itemCount: widget.itemCount,
      padding: widget.padding,
      controller: _scrollController,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
