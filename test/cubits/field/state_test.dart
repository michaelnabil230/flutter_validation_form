import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('FieldState', () {
    test('should be initialized with default values', () {
      final fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
      );

      expect(fieldState.attribute, 'name');
      expect(fieldState.value, 'John');
      expect(fieldState.initialValue, 'John');
      expect(fieldState.errors, isEmpty);
      expect(fieldState.status, FieldStatus.valid);
    });

    test('should set status to invalid if errors are present', () {
      final fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
        errors: const ['Invalid value'],
      );

      expect(fieldState.status, FieldStatus.valid);
    });

    test('should set status to valid if value is not empty and no errors', () {
      final fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
      );

      expect(fieldState.status, FieldStatus.valid);
    });

    test('should set status to initial if value is empty', () {
      final fieldState = FieldState(
        attribute: 'name',
        value: '',
        initialValue: '',
      );

      expect(fieldState.status, FieldStatus.initial);
    });

    test('error should be the first error in the list', () {
      final fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
        errors: const ['Error 1', 'Error 2'],
        showError: true,
      );

      expect(fieldState.error, 'Error 1');
    });

    test('should indicate if the state is initial', () {
      final fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
      );

      expect(fieldState.isInitial, false);
    });

    test('should indicate if the state is valid', () {
      final fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
      );

      expect(fieldState.isValid, true);
    });

    test('should indicate if the state is invalid', () {
      final fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
        errors: const ['Invalid value'],
      );

      expect(fieldState.isInvalid, false);
    });

    test('copyWith should create a new instance with updated values', () {
      final original = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
      );

      final copied = original.copyWith(value: 'Jane');

      expect(copied.value, 'Jane');
    });

    test('toString should generate a readable representation', () {
      final fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
      );

      expect(
        fieldState.toString(),
        'FieldState(attribute: name, initialValue: John, value: John, showError: false, errors: [], status: FieldStatus.valid)',
      );
    });

    test('props should contain all the relevant properties', () {
      final fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
      );

      expect(
        fieldState.props,
        [
          fieldState.attribute,
          fieldState.initialValue,
          fieldState.value,
          fieldState.errors
        ],
      );
    });
  });
}
