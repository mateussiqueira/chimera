import 'package:design_system/design_system.dart';
import 'package:lottie/lottie.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({
    super.key,
    required this.animation,
    this.color,
    this.width,
    this.height,
    this.repeat = false,
    this.fit,
    this.onFinish,
  });

  final Animations animation;
  final Color? color;
  final double? width;
  final double? height;
  final bool repeat;
  final BoxFit? fit;
  final VoidCallback? onFinish;

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onFinish?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      animationInfo.filePath,
      controller: _controller,
      package: animationInfo.package,
      width: widget.width,
      height: widget.height,
      onLoaded: (composition) {
        _controller
          ..duration = composition.duration
          ..forward();
        if (widget.repeat) {
          _controller.repeat();
        }
      },
      fit: widget.fit,
    );
  }

  AnimationInfo get animationInfo {
    final resolvedStyle = context.resolveStyle<AnimationsStyle>();
    return resolvedStyle?.animationFrom(widget.animation) ??
        widget.animation.animationInfo;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
