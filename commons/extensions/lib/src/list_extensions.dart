extension ListOptionalExtension<T> on List<T>? {
  T? getOrNull(int? index) {
    if (index == null || this?.isEmpty == true) {
      return null;
    }
    int finalLength = this?.length ?? 0;
    if (index >= 0 && index < finalLength) {
      return this?.elementAt(index);
    }
    return null;
  }
}

extension ListExtension<T> on List<T> {
  T? getOrNull(int? index) {
    if (index == null || isEmpty == true) {
      return null;
    }
    int finalLength = length;
    if (index >= 0 && index < finalLength) {
      return elementAt(index);
    }
    return null;
  }
}
