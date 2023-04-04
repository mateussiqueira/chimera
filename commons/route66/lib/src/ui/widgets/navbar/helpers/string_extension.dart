extension StringExtensions on String {
  String toRoute() {
    final length = this.length;
    final containsSlash = this[0] == '/';
    final containsSlashEnd = this[length] == '/';

    if (containsSlash && containsSlashEnd) {
      return '/$this/';
    } else if (containsSlash && containsSlashEnd == false) {
      return '/$this';
    } else if (containsSlash == false && containsSlashEnd) {
      return '$this/';
    }
    return this;
  }
}
