import '../extensions/translation_extension.dart';
import '../constants/translation_keys.dart';

abstract class AppFailure {
  String message;

  AppFailure({required this.message});

  static String convertFailureToMessage(AppFailure failure) {
    switch (failure.runtimeType) {
      case ServerFailure():
        return TranslationKeys.serverFailure.translateValue();

      case NoInternetFailure():
        return TranslationKeys.internetFailure.translateValue();

      case TimeOutFailure():
        return TranslationKeys.timeoutFailure.translateValue();

      case UnauthorisedFailure():
        return TranslationKeys.timeoutFailure.translateValue();

      case WrongInputDataFailure():
        return TranslationKeys.wrongInputFailure.translateValue();

      case CacheFailure():
        return TranslationKeys.cacheFailure.translateValue();

      case EmptyCacheFailure():
        return TranslationKeys.emptyCacheFailure.translateValue();

      case OperationNotAllowedFailure():
        return TranslationKeys.operationNotAllowedFailure.translateValue();

      default:
        return TranslationKeys.unexpectedFailure.translateValue();
    }
  }
}

class ServerFailure extends AppFailure {
  ServerFailure({required super.message});
}

class NoInternetFailure extends AppFailure {
  NoInternetFailure({required super.message});
}

class TimeOutFailure extends AppFailure {
  TimeOutFailure({required super.message});
}

class OperationNotAllowedFailure extends AppFailure {
  OperationNotAllowedFailure({required super.message});
}

class WrongInputDataFailure extends AppFailure {
  WrongInputDataFailure({required super.message});
}

class UnauthorisedFailure extends AppFailure {
  UnauthorisedFailure({required super.message});
}

class CacheFailure extends AppFailure {
  CacheFailure({required super.message});
}

class EmptyCacheFailure extends AppFailure {
  EmptyCacheFailure({required super.message});
}

class UnexpectedFailure extends AppFailure {
  UnexpectedFailure({required super.message});
}
