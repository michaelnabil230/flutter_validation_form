import 'package:validation_form/validation_form.dart';

class Validations {
  const Validations._();

  static Rule get isHexColor => IsHexColor();

  static Rule get isDate => IsDate();

  static Rule isDateAfter(DateTime date) => IsDateAfter(date);

  static Rule isDateBefore(DateTime date) => IsDateBefore(date);

  static Rule get isBoolean => IsBoolean();

  static Rule get isEmail => IsEmail();

  static Rule get isPort => IsPort();

  static Rule pattern(RegExp regExp) => PatternRule(regExp);

  static Rule get isLtr => IsLtr();

  static Rule get isRtl => IsRtl();

  static Rule containsAny(
    list, {
    caseSensitive = false,
  }) =>
      ContainsAny(list, caseSensitive: caseSensitive);

  static Rule isIn(List<String> list) => IsIn(list);

  static Rule isNotIn(List<String> list) => IsNotIn(list);

  static Rule notContainsAny(List<String> list) => NotContainsAny(list);

  // static Rule when({
  //   required bool condition,
  //   required String conditionName,
  // }) =>
  //     When(
  //       condition: condition,
  //       conditionName: conditionName,
  //     );

  static Rule password({
    int min = 8,
    bool lowercase = false,
    bool uppercase = false,
    bool numbers = false,
    bool specialCharacters = false,
  }) =>
      Password(
        min: min,
        lowercase: lowercase,
        uppercase: uppercase,
        numbers: numbers,
        specialCharacters: specialCharacters,
      );

  static Rule confirmedPassword(String other) => ConfirmedPassword(other);

  static Rule get isNumbersOnly => IsNumbersOnly();

  static Rule get isNumber => IsNumber();

  static Rule maxValue(int max) => MaxValue(max);

  static Rule minValue(int min) => MinValue(min);

  static Rule get isEgyPhone => IsEgyptianPhone();

  static Rule get isKsaPhone => IsSaudiPhone();

  static Rule contains(String other) => Contains(other);

  static Rule endsWith(String end) => EndsWith(end);

  static Rule get isEmpty => IsEmpty();

  static Rule get required => Required();

  static Rule match(String other, {bool caseSensitive = true}) =>
      Match(other, caseSensitive: caseSensitive);

  static Rule maxLength(int max) => MaxLength(max);

  static Rule minLength(int min) => MinLength(min);

  static Rule rangeLength(int max, int min) => RangeLength(max: max, min: min);

  static Rule notContains(String other) => NotContains(other);

  static Rule startsWith(Pattern pattern) => StartsWith(pattern);

  static Rule get uppercase => Uppercase();

  static Rule get lowercase => Lowercase();

  static Rule same(String same) => Same(same);

  static Rule get isUserName => IsUserName();

  static Rule get alphaNumeric => AlphaNumeric();

  static Rule get isUrl => IsUrl();

  static Rule get isFacebookUrl => IsFacebookUrl();

  static Rule get isInstagramUrl => IsInstagramUrl();

  static Rule get isYoutubeUrl => IsYoutubeUrl();
}
