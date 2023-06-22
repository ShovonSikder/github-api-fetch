class EmptyValueException implements Exception {
  final String message;

  EmptyValueException(this.message);

  @override
  String toString() {
    return 'EmptyValueException: $message';
  }
}
