enum CheckboxSize {
  sizeMd(20),
  sizeSm(16);

  const CheckboxSize(this.size);
  final double size;

  double get value {
    return size;
  }
}
