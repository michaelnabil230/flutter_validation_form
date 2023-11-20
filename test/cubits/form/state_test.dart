import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('FormState', () {
    test('should be initialized with default values', () {
      const formState = FormState();

      expect(formState.status, FormStatus.enable);
      expect(formState.isEdit, false);
      expect(formState.errors, isEmpty);
    });

    test('copyWith should create a new instance with updated values', () {
      const original = FormState();

      final copied =
          original.copyWith(status: FormStatus.loading, isEdit: true, errors: {
        'field1': ['error1']
      });

      expect(copied.status, FormStatus.loading);
      expect(copied.isEdit, true);
      expect(copied.errors, {
        'field1': ['error1']
      });
    });

    test('toString should generate a readable representation', () {
      const formState = FormState(
        status: FormStatus.enable,
        isEdit: true,
        errors: {
          'field1': ['error1']
        },
      );

      expect(
        formState.toString(),
        'FormState(status: FormStatus.enable, isEdit: true, errors: {field1: [error1]})',
      );
    });

    test('props should contain all the relevant properties', () {
      const formState = FormState(
        status: FormStatus.enable,
        isEdit: false,
        errors: {
          'field1': ['error1']
        },
      );

      expect(
        formState.props,
        [formState.status, formState.isEdit, formState.errors],
      );
    });
  });
}
