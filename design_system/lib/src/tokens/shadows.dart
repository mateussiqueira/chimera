import 'package:flutter/widgets.dart';

class Shadows {
  static const shadowColor = Color.fromRGBO(16, 24, 40, 1);
  static List<BoxShadow> shadowXs = [
    BoxShadow(
      offset: const Offset(0, 1),
      blurRadius: 2,
      color: shadowColor.withAlpha(40),
    ),
  ];
  static List<BoxShadow> shadowSm = [
    BoxShadow(
      offset: const Offset(0, 1),
      blurRadius: 3,
      color: shadowColor.withAlpha(10),
    ),
    BoxShadow(
      offset: const Offset(0, 1),
      blurRadius: 2,
      color: shadowColor.withAlpha(06),
    ),
  ];
  static List<BoxShadow> shadowMd = [
    BoxShadow(
      offset: const Offset(0, 4),
      blurRadius: 8,
      spreadRadius: -2,
      color: shadowColor.withAlpha(16),
    ),
    BoxShadow(
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: -2,
      color: shadowColor.withAlpha(16),
    ),
  ];
  static List<BoxShadow> shadowLg = [
    BoxShadow(
      offset: const Offset(0, 12),
      blurRadius: 16,
      spreadRadius: -4,
      color: shadowColor.withAlpha(8),
    ),
    BoxShadow(
      offset: const Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -2,
      color: shadowColor.withAlpha(8),
    ),
  ];
  static List<BoxShadow> shadowXl = [
    BoxShadow(
      offset: const Offset(0, 20),
      blurRadius: 24,
      spreadRadius: -4,
      color: shadowColor.withAlpha(8),
    ),
    BoxShadow(
      offset: const Offset(0, 8),
      blurRadius: 8,
      spreadRadius: -4,
      color: shadowColor.withAlpha(8),
    ),
  ];
  static List<BoxShadow> shadow2xl = [
    BoxShadow(
      offset: const Offset(0, 24),
      blurRadius: 48,
      spreadRadius: -12,
      color: shadowColor.withAlpha(46),
    ),
  ];
  static List<BoxShadow> shadow3Xl = [
    BoxShadow(
      offset: const Offset(0, 32),
      blurRadius: 64,
      spreadRadius: -12,
      color: shadowColor.withAlpha(36),
    ),
  ];
}
