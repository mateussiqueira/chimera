import 'package:design_system/design_system.dart';

class AnimationsStyle extends ThemeExtension<AnimationsStyle> {
  AnimationsStyle({
    required this.animationsMap,
  });

  final Map<Animations, AnimationInfo>? animationsMap;

  static AnimationsStyle light = AnimationsStyle(
    animationsMap: {
      for (final animation in Animations.values)
        animation: animation.animationInfo,
    },
  );

  @override
  ThemeExtension<AnimationsStyle> copyWith(
      {Map<Animations, AnimationInfo>? animationsMap}) {
    final newAnimationsMap = {...?this.animationsMap};
    if (animationsMap != null) {
      for (final animation in animationsMap.entries) {
        newAnimationsMap[animation.key] = animation.value;
      }
    }

    return AnimationsStyle(animationsMap: newAnimationsMap);
  }

  AnimationInfo animationFrom(Animations animation) {
    return animationsMap?[animation] ?? animation.animationInfo;
  }

  @override
  ThemeExtension<AnimationsStyle> lerp(
          ThemeExtension<AnimationsStyle>? other, double t) =>
      this;
}
