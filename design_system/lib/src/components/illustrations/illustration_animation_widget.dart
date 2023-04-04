import 'package:design_system/design_system.dart';

import 'illustration_widget.dart';

class IllustrationAnimationWidget extends IllustrationWidget {
  IllustrationAnimationWidget({
    super.key,
    required this.animation,
    required super.title,
    required super.subTitle,
    double? width,
    double? height,
  }) : super(
          illustration: AnimationWidget(
            animation: animation,
            width: width,
            height: height,
          ),
        );

  final Animations animation;
}
