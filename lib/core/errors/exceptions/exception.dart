sealed class AppException implements Exception {
  final String message;
  const AppException(this.message);

  @override
  String toString() => message;
}

final class ServerException extends AppException {
  const ServerException(super.message);
}

final class CacheException extends AppException {
  const CacheException(super.message);
}
