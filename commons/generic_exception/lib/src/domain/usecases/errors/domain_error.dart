abstract class DomainError implements Exception {
  DomainError({
    required this.message,
    this.code,
  });

  final String message;
  final String? code;
}
