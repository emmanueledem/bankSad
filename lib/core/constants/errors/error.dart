/// [NoInternetException] thrown when the phone does not have stable internet connection
class NoInternetException implements Exception {}

/// [ServerException] internal server error from the backend
class ServerException implements Exception {
  const ServerException({
    required this.message,
  });
  final String message;
}
