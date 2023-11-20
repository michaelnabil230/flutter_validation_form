import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/src/extensions/list.dart';

void main() {
  group('ListExtensions Tests', () {
    test('when() should add elements when condition is true', () {
      List<int> originalList = [1, 2, 3];
      List<int> additionalList = [4, 5, 6];
      bool condition = true;

      List<int> result = originalList.when(
        condition,
        additionalList,
      );

      expect(result, equals([1, 2, 3, 4, 5, 6]));
    });

    test('when() should not add elements when condition is false', () {
      List<int> originalList = [1, 2, 3];
      List<int> additionalList = [4, 5, 6];
      bool condition = false;

      List<int> result = originalList.when(
        condition,
        additionalList,
      );

      expect(result, equals([1, 2, 3]));
    });

    test('when() should add default elements when condition is false', () {
      List<int> originalList = [1, 2, 3];
      List<int> additionalList = [4, 5, 6];
      List<int> defaultList = [7, 8, 9];
      bool condition = false;

      List<int> result = originalList.when(
        condition,
        additionalList,
        defaultList,
      );

      expect(result, equals([1, 2, 3, 7, 8, 9]));
    });

    test('unless() should add elements when condition is false', () {
      List<int> originalList = [1, 2, 3];
      List<int> additionalList = [4, 5, 6];
      bool condition = false;

      List<int> result = originalList.unless(
        condition,
        additionalList,
      );

      expect(result, equals([1, 2, 3, 4, 5, 6]));
    });

    test('unless() should not add elements when condition is true', () {
      List<int> originalList = [1, 2, 3];
      List<int> additionalList = [4, 5, 6];
      bool condition = true;

      List<int> result = originalList.unless(
        condition,
        additionalList,
      );

      expect(result, equals([1, 2, 3]));
    });

    test('unless() should add default elements when condition is true', () {
      List<int> originalList = [1, 2, 3];
      List<int> additionalList = [4, 5, 6];
      List<int> defaultList = [7, 8, 9];
      bool condition = true;

      List<int> result = originalList.unless(
        condition,
        additionalList,
        defaultList,
      );

      expect(result, equals([1, 2, 3, 7, 8, 9]));
    });
  });
}
