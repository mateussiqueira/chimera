import 'package:design_system/design_system.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../../styles/learning_module_style.dart';
import '../question_navigation_presenter_mixin.dart';
import 'question_navigation.dart';

class QuestionNavigationItems extends StatefulWidget {
  const QuestionNavigationItems({
    required this.presenter,
    super.key,
  });

  final QuestionNavigationPresenterMixin presenter;

  @override
  State<QuestionNavigationItems> createState() =>
      _QuestionNavigationItemsState();
}

class _QuestionNavigationItemsState extends State<QuestionNavigationItems>
    with ScrollMixin {
  static const threeDots = '...';
  final borderRadius = BorderRadius.circular(Sizes.size20);
  final scrollController = AutoScrollController(axis: Axis.horizontal);
  bool _runSizeAnim = false;
  bool _lastState = false;
  bool _showItems = false;
  bool _showControls = false;
  int _currentIndex = 0;
  int _maxPerPageItems = 0;
  double _itemSpacing = 0;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.presenter,
      builder: (context) {
        final opened = widget.presenter.isOpen();
        if (_lastState != opened) {
          _lastState = opened;
          _initNavAnimation(opened);
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_showItems) ...[
              LayoutBuilder(
                builder: (BuildContext ctx, BoxConstraints constraints) {
                  final width = _setupNavConfig(constraints.biggest);

                  return ClipRRect(
                    borderRadius: borderRadius,
                    child: AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 100,
                      ),
                      color: !_runSizeAnim
                          ? moduleStyle.tertiary
                              .backgroundModuleSecondaryColor(context)
                          : moduleStyle.primary
                              .backgroundModulePrimaryColor(context),
                      width: !_runSizeAnim ? Sizes.size08 : width,
                      height: Sizes.size40,
                      child: !_runSizeAnim
                          ? const EmptyWidget()
                          : Container(
                              decoration: BoxDecoration(
                                color: moduleStyle.secondary
                                    .textModulePrimaryColor(context),
                                borderRadius: borderRadius,
                                boxShadow: Shadows.shadowSm,
                              ),
                              child: Row(
                                children: [
                                  if (canBackPage && _showControls) ...[
                                    QuestionNavigationItem(
                                      onPressed: () => prevPage(),
                                      isSelected: false,
                                      itemCompleted: widget.presenter
                                          .isAnsweredBeforeIndex(
                                        prevPageStartIndex,
                                      ),
                                      hasCompleted:
                                          widget.presenter.isAnsweredAfterIndex(
                                        0,
                                      ),
                                      child: _questionNavigationItemContent(
                                        threeDots,
                                      ),
                                    ),
                                  ],
                                  Expanded(
                                    child: _list,
                                  ),
                                  if (canNextPage && _showControls) ...[
                                    QuestionNavigationItem(
                                      onPressed: () => nextPage(),
                                      isSelected: false,
                                      itemCompleted:
                                          widget.presenter.isAnsweredAfterIndex(
                                        nextPageStartIndex,
                                      ),
                                      hasCompleted:
                                          widget.presenter.isAnsweredAfterIndex(
                                        0,
                                      ),
                                      child: _questionNavigationItemContent(
                                        threeDots,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                    ),
                  );
                },
              ),
              const SpacingVertical.spacing12(),
            ]
          ],
        );
      },
    );
  }

  Widget _questionNavigationItemContent(String text) {
    return TextWidget.textXsMedium(
      text: text,
      style: moduleStyle.tertiary.textModuleStyleWithPrimaryColor(context),
      textAlign: TextAlign.center,
    );
  }

  Widget get _list {
    return ListView.separated(
      padding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.presenter.getTotal(),
      itemBuilder: (context, index) {
        return AutoScrollTag(
          key: ValueKey(index),
          controller: scrollController,
          index: index,
          child: QuestionNavigationItem(
            onPressed: () {
              widget.presenter.toggleOpen();
              widget.presenter.setCurrentIndex(index);
            },
            isSelected: widget.presenter.isSelectedIndex(index),
            itemCompleted: widget.presenter.isAnsweredIndex(index),
            hasCompleted: widget.presenter.isAnsweredAfterIndex(
              0,
            ),
            child: _questionNavigationItemContent(
              indexToPage(index),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          width: _itemSpacing,
        );
      },
    );
  }

  String indexToPage(int index) {
    final humanizedIndex = index + 1;
    return '$humanizedIndex';
  }

  Future<void> _initNavAnimation(bool opening) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (opening) {
        setState(() => _showItems = true);
      }

      setState(() {
        _currentIndex = 0;
        _showControls = !opening;
        _runSizeAnim = !opening;
      });

      await Future.delayed(const Duration(milliseconds: 100));

      setState(() => _runSizeAnim = opening);

      await Future.delayed(const Duration(milliseconds: 250));
      if (scrollController.hasClients && widget.presenter.runAnimation) {
        widget.presenter.runAnimation = false;
        await Future.delayed(const Duration(milliseconds: 250));
        await scrollListToEnd(controller: scrollController);
        await Future.delayed(const Duration(milliseconds: 500));
        await scrollListToStart(controller: scrollController);
      }
      if (opening) {
        setState(() {
          final index = widget.presenter.currentIndex();
          _currentIndex = index;
          _scrollTo(index, true);
        });
      }

      setState(() => _showControls = opening);

      if (!opening) {
        setState(() => _showItems = false);
      }
    });
  }

  double _setupNavConfig(Size size) {
    final totalItems = widget.presenter.getTotal();

    const itemSize = Sizes.size40;
    final width = size.width;
    final scaledWidth = width * 0.95;

    _maxPerPageItems = scaledWidth ~/ itemSize;

    if (_maxPerPageItems >= totalItems) {
      _maxPerPageItems = totalItems;
    }

    if (_maxPerPageItems * itemSize < scaledWidth) {
      final availableSpacing = scaledWidth - _maxPerPageItems * itemSize;
      _itemSpacing = availableSpacing / _maxPerPageItems;
    }

    return _maxPerPageItems * (itemSize + _itemSpacing) - _itemSpacing;
  }

  bool get canBackPage {
    final totalItems = widget.presenter.getTotal();
    if (totalItems <= _maxPerPageItems) {
      return false;
    }
    return _currentIndex > 0;
  }

  bool get canNextPage {
    final totalItems = widget.presenter.getTotal();
    if (totalItems <= _maxPerPageItems) {
      return false;
    }
    return _currentIndex < (widget.presenter.getTotal() - 1);
  }

  int get nextPageStartIndex {
    return _currentIndex + getItemsPerPage();
  }

  void nextPage() {
    setState(() {
      if (canNextPage) {
        final itemsPerPage = getItemsPerPage();
        final maxIndex = widget.presenter.getTotal() - 1;
        int index = _currentIndex + getItemsPerPage();

        if (index > maxIndex || (maxIndex - index) < itemsPerPage) {
          index = maxIndex;
        }
        _currentIndex = index;
        _scrollTo(index, true);
      }
    });
  }

  int get prevPageStartIndex {
    final itemsPerPage = getItemsPerPage();
    final maxIndex = widget.presenter.getTotal() - 1;
    if ((maxIndex - _currentIndex) < itemsPerPage) {
      return maxIndex - itemsPerPage;
    }
    return _currentIndex;
  }

  void prevPage() {
    setState(() {
      if (canBackPage) {
        final itemsPerPage = getItemsPerPage();
        int index = _currentIndex - itemsPerPage;
        if (index < itemsPerPage) {
          index = 0;
        }
        _currentIndex = index;
        _scrollTo(index, false);
      }
    });
  }

  int getItemsPerPage() {
    int minusItems = 0;
    if (canNextPage) {
      minusItems++;
    }
    if (canBackPage) {
      minusItems++;
    }

    return _maxPerPageItems - minusItems;
  }

  void _scrollTo(int position, bool forward) {
    AutoScrollPosition preferPosition = AutoScrollPosition.end;

    if (forward) {
      preferPosition = AutoScrollPosition.begin;
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.scrollToIndex(position, preferPosition: preferPosition);
    });
  }

  bool get isTablet {
    return ResponsiveLayoutWidget.isTablet(context);
  }

  bool get isLandscape {
    return ResponsiveLayoutWidget.isLandscape(context);
  }
}
