import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/classes/default_validation_messages.dart';
import 'package:validation_form/src/classes/validation_names.dart';

void main() {
  group('Validation Messages', () {
    test('Confirmed Password', () {
      final message =
          defaultValidationMessages[ValidationNames.confirmedPassword]!(
              'password');
      expect(message, 'The password field confirmation does not match.');
    });

    test('Password Min Length', () {
      final message = defaultValidationMessages[ValidationNames.passwordMin]!(
          'password', [8]);
      expect(message, 'The password field must be at least 8 characters long.');
    });

    test('Password Lowercase', () {
      final message =
          defaultValidationMessages[ValidationNames.passwordLowercase]!(
              'password');
      expect(message,
          'The password field must contain at least one lowercase letter.');
    });

    test('Password Uppercase', () {
      final message =
          defaultValidationMessages[ValidationNames.passwordUppercase]!(
              'password');
      expect(message,
          'The password field must contain at least one uppercase letter.');
    });

    test('Password Special Characters', () {
      final message =
          defaultValidationMessages[ValidationNames.passwordSpecialCharacters]!(
              'password');
      expect(message,
          'The password field must contain at least one special character.');
    });

    test('Password Numbers', () {
      final message =
          defaultValidationMessages[ValidationNames.passwordNumbers]!(
              'password');
      expect(message, 'The password field must contain at least one number.');
    });

    test('Must Be After Date', () {
      final message =
          defaultValidationMessages[ValidationNames.mustBeAfterDate]!(
              'date', ['2023-01-01']);
      expect(message, 'The date field must be a date after 2023-01-01.');
    });

    test('Must Be Before Date', () {
      final message =
          defaultValidationMessages[ValidationNames.mustBeBeforeDate]!(
              'date', ['2023-12-31']);
      expect(message, 'The date field must be a date before 2023-12-31.');
    });

    test('Is Not Date Format', () {
      final message =
          defaultValidationMessages[ValidationNames.isNotDateFormat]!('date');
      expect(message, 'The date field must be a valid date.');
    });

    test('Must Be Max', () {
      final message =
          defaultValidationMessages[ValidationNames.mustBeMax]!('value', [100]);
      expect(message, 'The value field must not be greater than 100.');
    });

    test('Must Be Int', () {
      final message =
          defaultValidationMessages[ValidationNames.mustBeInt]!('number');
      expect(message, 'The number field must be an integer.');
    });

    test('Is Decimal', () {
      final message =
          defaultValidationMessages[ValidationNames.isDecimal]!('decimal');
      expect(
          message, 'The decimal field must be a number with decimal places.');
    });

    test('Must Be Min', () {
      final message =
          defaultValidationMessages[ValidationNames.mustBeMin]!('value', [10]);
      expect(message, 'The value field must be at least 10.');
    });

    test('Is Numbers Only', () {
      final message =
          defaultValidationMessages[ValidationNames.isNumbersOnly]!('value');
      expect(message, 'The value field must only contain numbers.');
    });

    test('Alpha Numeric', () {
      final message = defaultValidationMessages[ValidationNames.alphaNumeric]!(
          'alphanumeric');
      expect(message,
          'The alphanumeric field must only contain letters and numbers.');
    });

    test('Must Contain Any', () {
      final message =
          defaultValidationMessages[ValidationNames.mustContainsAny]!('text', [
        ['apple', 'banana']
      ]);

      expect(message,
          'The text field must contain at least one of the following: apple, banana.');
    });

    test('Must Not Contain Any', () {
      final message =
          defaultValidationMessages[ValidationNames.mustNotContainsAny]!(
              'text', [
        ['apple', 'banana']
      ]);
      expect(message,
          'The text field must not contain any of the following: apple, banana.');
    });

    test('Must Not Be In List', () {
      final message =
          defaultValidationMessages[ValidationNames.mustNotBeInList]!('value', [
        ['apple', 'banana']
      ]);
      expect(
          message, 'The value field must not be in the list: apple, banana.');
    });

    test('Must Be In List', () {
      final message =
          defaultValidationMessages[ValidationNames.mustBeInList]!('value', [
        ['apple', 'banana']
      ]);
      expect(message, 'The value field must be in the list: apple, banana.');
    });

    test('Is Not Email Address', () {
      final message =
          defaultValidationMessages[ValidationNames.isNotEmailAddress]!(
              'email');
      expect(message, 'The email field must be a valid email address.');
    });

    test('Is Not Port', () {
      final message =
          defaultValidationMessages[ValidationNames.isNotPort]!('port');
      expect(message, 'The port field must be a valid port number.');
    });

    test('Pattern Mismatch', () {
      final message =
          defaultValidationMessages[ValidationNames.pattern]!('pattern');
      expect(message, 'The pattern field does not match the pattern.');
    });

    test('Is Not Valid', () {
      final message =
          defaultValidationMessages[ValidationNames.isNotValid]!('value');
      expect(message, 'The value field is not valid.');
    });

    test('Is Not Bool', () {
      final message =
          defaultValidationMessages[ValidationNames.isNotBool]!('boolValue');
      expect(message, 'The boolValue field must be a boolean (true or false).');
    });

    test('Must Be Arabic', () {
      final message =
          defaultValidationMessages[ValidationNames.mustBeArabic]!('text');
      expect(message, 'The text field must be in Arabic language.');
    });

    test('Must Be English', () {
      final message =
          defaultValidationMessages[ValidationNames.mustBeEnglish]!('text');
      expect(message, 'The text field must be in English language.');
    });

    test('Must Be Hex Color', () {
      final message =
          defaultValidationMessages[ValidationNames.mustBeHexColor]!('color');
      expect(message, 'The color field must be a valid hex color code.');
    });

    test('Not Valid Instagram URL', () {
      final message =
          defaultValidationMessages[ValidationNames.notValidInstagramUrl]!(
              'instagramUrl');
      expect(message, 'The instagramUrl field must be a valid Instagram URL.');
    });

    test('Is Not Secure URL', () {
      final message =
          defaultValidationMessages[ValidationNames.isNotSecureUrl]!('url');
      expect(message, 'The url field must be a secure URL (https).');
    });

    test('Not Valid URL', () {
      final message =
          defaultValidationMessages[ValidationNames.notValidUrl]!('url');
      expect(message, 'The url field must be a valid URL.');
    });

    test('Not Valid Facebook URL', () {
      final message =
          defaultValidationMessages[ValidationNames.notValidFacebookUrl]!(
              'facebookUrl');
      expect(message, 'The facebookUrl field must be a valid Facebook URL.');
    });

    test('Not Valid YouTube URL', () {
      final message =
          defaultValidationMessages[ValidationNames.notValidYoutubeUrl]!(
              'youtubeUrl');
      expect(message, 'The youtubeUrl field must be a valid YouTube URL.');
    });

    test('Is Phone', () {
      final message =
          defaultValidationMessages[ValidationNames.isPhone]!('phone');
      expect(message, 'The phone field must be a valid phone number.');
    });

    test('Username Format', () {
      final message =
          defaultValidationMessages[ValidationNames.username]!('username');
      expect(message, 'The username field must be in a valid username format.');
    });

    test('Required Field', () {
      final message =
          defaultValidationMessages[ValidationNames.required]!('field');
      expect(message, 'The field field is required.');
    });

    test('Contains Specific Text', () {
      final message = defaultValidationMessages[ValidationNames.isItContains]!(
          'text', ['abc']);
      expect(message, 'The text field does not contain abc');
    });

    test('Must End With', () {
      final message = defaultValidationMessages[ValidationNames.mustEndWith]!(
          'text', ['xyz']);
      expect(message, 'The text field must end with xyz');
    });

    test('Max Value', () {
      final message =
          defaultValidationMessages[ValidationNames.max]!('value', [100]);
      expect(message, 'The value field must not be greater than 100');
    });

    test('Not Contains Invalid Characters', () {
      final message =
          defaultValidationMessages[ValidationNames.notContains]!('text');
      expect(message, 'The text field contains invalid characters.');
    });

    test('Should Match', () {
      final message = defaultValidationMessages[ValidationNames.shouldMatch]!(
          'password', ['confirmPassword']);
      expect(message, 'The password field should match confirmPassword');
    });

    test('Uppercase Letters', () {
      final message =
          defaultValidationMessages[ValidationNames.uppercase]!('text');
      expect(message, 'The text field must be in uppercase letters.');
    });

    test('Must Be in Range', () {
      final message = defaultValidationMessages[ValidationNames.mustBeRange]!(
          'value', [10, 20]);
      expect(message, 'The value field must be between 10 and 20');
    });

    test('Must Be the Same As', () {
      final message = defaultValidationMessages[ValidationNames.same]!(
          'password', ['confirmPassword']);
      expect(message, 'The password field must be the same as confirmPassword');
    });

    test('Starts With', () {
      final message = defaultValidationMessages[ValidationNames.startsWith]!(
          'text', ['prefix']);
      expect(message, 'The text field must start with prefix');
    });

    test('Min Value', () {
      final message =
          defaultValidationMessages[ValidationNames.min]!('value', [5]);
      expect(message, 'The value field must be at least 5');
    });

    test('Lowercase Letters', () {
      final message =
          defaultValidationMessages[ValidationNames.lowercase]!('text');
      expect(message, 'The text field must be in lowercase letters.');
    });

    test('Is Not Empty', () {
      final message =
          defaultValidationMessages[ValidationNames.isEmpty]!('field');
      expect(message, 'The field field cannot be empty.');
    });
  });
}
