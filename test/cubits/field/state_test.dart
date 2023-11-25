import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('FieldState', () {
    test('should be initialized with default values', () {
      const fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
      );

      expect(fieldState.attribute, 'name');
      expect(fieldState.value, 'John');
      expect(fieldState.initialValue, 'John');
      expect(fieldState.errors, isEmpty);
      expect(fieldState.status, FieldStatus.initial);
    });

    test('should set status to invalid if errors are present', () {
      const fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
        errors: ['Invalid value'],
      );

      expect(fieldState.status, FieldStatus.initial);
    });

    test('should set status to valid if value is not empty and no errors', () {
      const fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
      );

      expect(fieldState.status, FieldStatus.initial);
    });

    test('should set status to initial if value is empty', () {
      const fieldState = FieldState(
        attribute: 'name',
        value: '',
        initialValue: '',
      );

      expect(fieldState.status, FieldStatus.initial);
    });

    test('error should be the first error in the list', () {
      const fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
        errors: ['Error 1', 'Error 2'],
        showError: true,
      );

      expect(fieldState.error, 'Error 1');
    });

    test('should indicate if the state is initial', () {
      const fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
      );

      expect(fieldState.isInitial, isTrue);
    });

    test('should indicate if the state is valid', () {
      const fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
      );

      expect(fieldState.isValid, isFalse);
    });

    test('should indicate if the state is invalid', () {
      const fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
        errors: ['Invalid value'],
      );

      expect(fieldState.isInvalid, isFalse);
    });

    test('copyWith should create a new instance with updated values', () {
      const original = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
      );

      final copied = original.copyWith(value: 'Jane');

      expect(copied.value, 'Jane');
    });

    test('toString should generate a readable representation', () {
      const fieldState = FieldState(
        attribute: 'name',
        value: 'John',
        initialValue: 'John',
      );

      expect(
        fieldState.toString(),
        'FieldState(attribute: name, initialValue: John, value: John, showError: false, errors: [], status: FieldStatus.initial)',
      );
    });

    test('props should contain all the relevant properties', () {
      const fieldState = FieldState(
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
