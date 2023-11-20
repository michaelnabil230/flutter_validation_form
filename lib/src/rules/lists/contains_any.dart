import 'package:validation_form/src/rules/rule.dart';

class ContainsAny extends Rule {
  final List<String> list;

  final bool caseSensitive;

  ContainsAny(
    this.list, {
    this.caseSensitive = false,
  });

  @override
  bool isValid(String value) =>
      containsAny(value, list, caseSensitive: caseSensitive);

  @override
  String get name => ValidationNames.mustContainsAny;

  @override
  List get parameters => [list];
}

bool containsAny(
  String v,
  List<String> list, {
  bool caseSensitive = false,
  bool trim = true,
}) {
  if (trim) {
    return list.any(
      (e) => caseSensitive
          ? v.trim().contains(e.trim())
          : v.trim().toLowerCase().contains(e.trim().toLowerCase()),
    );
  }
  return list.any(
    (e) => caseSensitive
        ? v.contains(e.trim())
        : v.toLowerCase().contains(e.toLowerCase()),
  );
}
