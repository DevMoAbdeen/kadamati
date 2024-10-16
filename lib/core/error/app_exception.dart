import 'error_model.dart';

/// /////////////// Api Exceptions /////////////// ///
class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

class UnauthorisedException implements Exception {
  final ErrorModel errorModel;

  UnauthorisedException({required this.errorModel});
}

class WrongInputDataException implements Exception {
  final ErrorModel errorModel;

  WrongInputDataException({required this.errorModel});
}

class OperationNotAllowedException implements Exception {
  final ErrorModel errorModel;

  OperationNotAllowedException({required this.errorModel});
}

/// /////////////// Other Exceptions /////////////// ///

class NoInternetException implements Exception {}

class TimeOutException implements Exception {}

class CacheException implements Exception {}

class EmptyCacheException implements Exception {}

class UnexpectedException implements Exception {
  final ErrorModel errorModel;

  UnexpectedException({required this.errorModel});
}
