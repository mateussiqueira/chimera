abstract class GenericException implements Exception {
  GenericException({
    this.message,
  });

  final String? message;
}
