import 'package:validation_form/src/rules/rule.dart';

class Match extends Rule {
  final String other;
  final bool caseSensitive;

  Match(
    this.other, {
    this.caseSensitive = true,
  });

  @override
  bool isValid(String value) => caseSensitive
      ? _match(value, other)
      : _match(value.toLowerCase(), other.toLowerCase());

  @override
  String get name => ValidationNames.shouldMatch;

  @override
  List<Object> get parameters => [other];
}

bool _match(
  String input,
  String other,
) =>
    input.runtimeType == other.runtimeType && identical(input, other) ||
    input == other;
