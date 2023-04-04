import '../../design_system.dart';

extension BuildContextExtension on BuildContext {
  T? resolveStyle<T>() => Theme.of(this).extension<T>();
}
