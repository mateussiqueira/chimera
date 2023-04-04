extension MapExtensions on Map? {
  void removeNullAndEmptyParams() {
    if (this != null) {
      final keys = this!.keys.toList(growable: false);
      for (String key in keys) {
        final value = this![key];
        if (value == null || value == '' || (value is List && value.isEmpty)) {
          this?.remove(key);
        } else if (value is Map) {
          value.removeNullAndEmptyParams();
        }
      }
    }
  }
}
