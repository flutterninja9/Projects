class NetworkException implements Exception {
  final String message;

  NetworkException({
    this.message,
  });
}

class CacheException implements Exception {
  final String message;

  CacheException({
    this.message,
  });
}
