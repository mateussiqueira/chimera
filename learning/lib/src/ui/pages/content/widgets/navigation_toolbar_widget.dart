import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/pages/content/content.dart';

class NavigationToolbarWidget extends StatefulWidget {
  const NavigationToolbarWidget({
    Key? key,
    required this.presenter,
    required this.child,
  }) : super(key: key);

  final ContentPresenter presenter;
  final Widget child;

  @override
  State<NavigationToolbarWidget> createState() =>
      _NavigationToolbarWidgetState();
}

class _NavigationToolbarWidgetState extends State<NavigationToolbarWidget> {
  bool _showControl = false;
  bool _isVisible = false;
  Timer? _timer;
  PointerDownEvent? _down;
  bool _deltaReset = false;

  @override
  void initState() {
    super.initState();
    showControls();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerMove: (event) {
        if (event.delta.dy == 0 && event.delta.dx == 0) {
          _deltaReset = true;
        } else {
          _deltaReset = false;
          showControls();
        }
      },
      onPointerDown: (event) {
        _down = event;
        _deltaReset = true;
      },
      onPointerUp: (event) {
        final downTimestamp = _down?.timeStamp.inMilliseconds;
        if (downTimestamp != null) {
          if (_deltaReset) {
            if (_showControl) {
              hideControls();
            } else {
              showControls();
            }
          }
        }
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: widget.child,
          ),
          AnimatedOpacity(
            opacity: _showControl ? 1 : 0,
            duration: const Duration(milliseconds: 250),
            onEnd: () {
              setState(() {
                if (!_showControl) {
                  _isVisible = false;
                }
              });
            },
            child: _controls,
          ),
        ],
      ),
    );
  }

  void hideControls() {
    if (!mounted) {
      return;
    }

    setState(() => _showControl = false);
    _timer?.cancel();
  }

  void showControls() {
    if (!mounted) {
      return;
    }

    setState(() {
      _showControl = true;
      _isVisible = true;
    });

    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 3), () => hideControls());
  }

  Widget get _controls {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: Sizes.size32,
        ),
        child: ListenableBuilder(
          listenable: widget.presenter,
          builder: (context) {
            if (!_isVisible) {
              return const EmptyWidget();
            }
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: widget.presenter.canGoBack ? 1 : 0.6,
                  child: SecondaryButton.iconXl(
                    icon: Icons.arrowLeft,
                    onPressed: widget.presenter.canGoBack
                        ? () => widget.presenter.back()
                        : null,
                  ),
                ),
                const SpacingHorizontal.spacing08(),
                Opacity(
                  opacity: widget.presenter.canGoForward ? 1 : 0.6,
                  child: SecondaryButton.iconXl(
                    icon: Icons.arrowRight,
                    onPressed: widget.presenter.canGoForward
                        ? () => widget.presenter.forward()
                        : null,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
