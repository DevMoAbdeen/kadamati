abstract class TranslationKeys {
  /// Text Fields Values
  static const String name = "TextFieldsValues.name";
  static const String email = "TextFieldsValues.email";
  static const String password = "TextFieldsValues.password";
  static const String confirmPassword = "TextFieldsValues.confirm_password";
  static const String title = "TextFieldsValues.title";
  static const String type = "TextFieldsValues.type";

  /// Buttons Values
  static const String login = "ButtonValues.login";
  static const String signup = "ButtonValues.signup";

  /// Text Fields Validator
  static const String emptyName = "TextFieldsValidator.empty_name";
  static const String invalidName = "TextFieldsValidator.invalid_name";
  static const String invalidFullName = "TextFieldsValidator.invalid_full_name";
  static const String emptyEmail = "TextFieldsValidator.empty_email";
  static const String invalidEmail = "TextFieldsValidator.invalid_email";
  static const String shortPassword = "TextFieldsValidator.short_password";
  static const String weakPassword = "TextFieldsValidator.weak_password";
  static const String notConfirmationPassword = "TextFieldsValidator.not_confirmation_password";

  /// Error Values
  static const String serverFailure = "ErrorValues.server_failure";
  static const String internetFailure = "ErrorValues.internet_failure";
  static const String timeoutFailure = "ErrorValues.timeout_failure";
  static const String operationNotAllowedFailure = "ErrorValues.operation_not_allowed_failure";
  static const String wrongInputFailure = "ErrorValues.wrong_input_failure";
  static const String unauthorisedFailure = "ErrorValues.unauthorised_failure";
  static const String cacheFailure = "ErrorValues.cache_failure";
  static const String emptyCacheFailure = "ErrorValues.empty_cache_failure";
  static const String unexpectedFailure = "ErrorValues.unexpected_failure";
}
