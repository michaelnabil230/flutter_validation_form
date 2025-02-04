import 'package:validation_form/validation_form.dart';

class ValidationMessages {
  static Map<String, ValidationMessage> messages = {};

  static Map<String, ValidationMessage> defaultMessages = {
    ValidationNames.confirmedPassword: (attribute, [_ = const []]) =>
        'The $attribute field confirmation does not match.',
    ValidationNames.passwordMin: (attribute, [parameters = const []]) =>
        'The $attribute field must be at least ${parameters[0]} characters long.',
    ValidationNames.passwordLowercase: (attribute, [_ = const []]) =>
        'The $attribute field must contain at least one lowercase letter.',
    ValidationNames.passwordUppercase: (attribute, [_ = const []]) =>
        'The $attribute field must contain at least one uppercase letter.',
    ValidationNames.passwordSpecialCharacters: (attribute, [_ = const []]) =>
        'The $attribute field must contain at least one special character.',
    ValidationNames.passwordNumbers: (attribute, [_ = const []]) =>
        'The $attribute field must contain at least one number.',
    ValidationNames.mustBeAfterDate: (attribute, [parameters = const []]) =>
        'The $attribute field must be a date after ${parameters[0]}.',
    ValidationNames.mustBeBeforeDate: (attribute, [parameters = const []]) =>
        'The $attribute field must be a date before ${parameters[0]}.',
    ValidationNames.isNotDateFormat: (attribute, [_ = const []]) =>
        'The $attribute field must be a valid date.',
    ValidationNames.mustBeMax: (attribute, [parameters = const []]) =>
        'The $attribute field must not be greater than ${parameters[0]}.',
    ValidationNames.mustBeInt: (attribute, [_ = const []]) =>
        'The $attribute field must be an integer.',
    ValidationNames.isDecimal: (attribute, [_ = const []]) =>
        'The $attribute field must be a number with decimal places.',
    ValidationNames.mustBeMin: (attribute, [parameters = const []]) =>
        'The $attribute field must be at least ${parameters[0]}.',
    ValidationNames.isNumbersOnly: (attribute, [_ = const []]) =>
        'The $attribute field must only contain numbers.',
    ValidationNames.alphaNumeric: (attribute, [_ = const []]) =>
        'The $attribute field must only contain letters and numbers.',
    ValidationNames.mustContainsAny: (attribute, [parameters = const []]) {
      final list = parameters[0] as List;
      return 'The $attribute field must contain at least one of the following: ${list.join(', ')}.';
    },
    ValidationNames.mustNotContainsAny: (attribute, [parameters = const []]) {
      final list = parameters[0] as List;
      return 'The $attribute field must not contain any of the following: ${list.join(', ')}.';
    },
    ValidationNames.mustNotBeInList: (attribute, [parameters = const []]) {
      final list = parameters[0] as List;
      return 'The $attribute field must not be in the list: ${list.join(', ')}.';
    },
    ValidationNames.mustBeInList: (attribute, [parameters = const []]) {
      final list = parameters[0] as List;
      return 'The $attribute field must be in the list: ${list.join(', ')}.';
    },
    ValidationNames.isNotEmailAddress: (attribute, [_ = const []]) =>
        'The $attribute field must be a valid email address.',
    ValidationNames.isNotPort: (attribute, [_ = const []]) =>
        'The $attribute field must be a valid port number.',
    ValidationNames.pattern: (attribute, [_ = const []]) =>
        'The $attribute field does not match the pattern.',
    ValidationNames.isIpAddress: (attribute, [_ = const []]) =>
        'The $attribute field must be a valid IP address.',
    ValidationNames.isNotValid: (attribute, [_ = const []]) =>
        'The $attribute field is not valid.',
    ValidationNames.isNotBool: (attribute, [_ = const []]) =>
        'The $attribute field must be a boolean (true or false).',
    ValidationNames.mustBeArabic: (attribute, [_ = const []]) =>
        'The $attribute field must be in Arabic language.',
    ValidationNames.mustBeEnglish: (attribute, [_ = const []]) =>
        'The $attribute field must be in English language.',
    ValidationNames.mustBeHexColor: (attribute, [_ = const []]) =>
        'The $attribute field must be a valid hex color code.',
    ValidationNames.notValidInstagramUrl: (attribute, [_ = const []]) =>
        'The $attribute field must be a valid Instagram URL.',
    ValidationNames.isNotSecureUrl: (attribute, [_ = const []]) =>
        'The $attribute field must be a secure URL (https).',
    ValidationNames.notValidUrl: (attribute, [_ = const []]) =>
        'The $attribute field must be a valid URL.',
    ValidationNames.notValidFacebookUrl: (attribute, [_ = const []]) =>
        'The $attribute field must be a valid Facebook URL.',
    ValidationNames.notValidYoutubeUrl: (attribute, [_ = const []]) =>
        'The $attribute field must be a valid YouTube URL.',
    ValidationNames.isPhone: (attribute, [_ = const []]) =>
        'The $attribute field must be a valid phone number.',
    ValidationNames.username: (attribute, [_ = const []]) =>
        'The $attribute field must be in a valid username format.',
    ValidationNames.required: (attribute, [_ = const []]) =>
        'The $attribute field is required.',
    ValidationNames.isItContains: (attribute, [parameters = const []]) =>
        'The $attribute field does not contain ${parameters[0]}',
    ValidationNames.mustEndWith: (attribute, [parameters = const []]) =>
        'The $attribute field must end with ${parameters[0]}',
    ValidationNames.max: (attribute, [parameters = const []]) =>
        'The $attribute field must not be greater than ${parameters[0]}',
    ValidationNames.notContains: (attribute, [_ = const []]) =>
        'The $attribute field contains invalid characters.',
    ValidationNames.shouldMatch: (attribute, [parameters = const []]) =>
        'The $attribute field should match ${parameters[0]}',
    ValidationNames.uppercase: (attribute, [_ = const []]) =>
        'The $attribute field must be in uppercase letters.',
    ValidationNames.mustBeRange: (attribute, [parameters = const []]) =>
        'The $attribute field must be between ${parameters[0]} and ${parameters[1]}',
    ValidationNames.same: (attribute, [parameters = const []]) =>
        'The $attribute field must be the same as ${parameters[0]}',
    ValidationNames.startsWith: (attribute, [parameters = const []]) =>
        'The $attribute field must start with ${parameters[0]}',
    ValidationNames.min: (attribute, [parameters = const []]) =>
        'The $attribute field must be at least ${parameters[0]}',
    ValidationNames.lowercase: (attribute, [_ = const []]) =>
        'The $attribute field must be in lowercase letters.',
    ValidationNames.isEmpty: (attribute, [_ = const []]) =>
        'The $attribute field cannot be empty.',
  };
}
