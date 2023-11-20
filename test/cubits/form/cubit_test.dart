import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

class TestFormCubit extends FormCubit {
  TestFormCubit({super.status});

  @override
  List<FieldCubit> initializeFields() {
    return [
      FieldCubit(attribute: 'field1', rules: () => [Required()]),
      FieldCubit(attribute: 'field2', rules: () => [Required()]),
    ];
  }
}

void main() {
  group('FormCubit', () {
    test('should be initialized with default values', () {
      final formCubit = TestFormCubit();

      expect(formCubit.state.status, FormStatus.disable);
      expect(formCubit.isEdit, isFalse);
      expect(formCubit.fields.length, 2);
    });

    test('setShowErrorOnAllFields should trigger errorsCheck on all fields',
        () {
      final formCubit = TestFormCubit();

      formCubit.setShowErrorOnAllFields();

      for (final field in formCubit.fields) {
        expect(field.state.errors.isNotEmpty, isTrue);
      }
    });

    test('reset should trigger reset on all fields', () {
      final formCubit = TestFormCubit();

      formCubit.reset();

      for (final field in formCubit.fields) {
        expect(field.state.value, field.state.initialValue);
      }
    });

    test('close should close all fields', () async {
      final formCubit = TestFormCubit();

      await formCubit.close();

      for (final field in formCubit.fields) {
        expect(field.isClosed, isTrue);
      }
    });

    test('refreshForm should update state based on field statuses', () {
      final formCubit = TestFormCubit();

      for (final field in formCubit.fields) {
        field.setValue('John');
      }

      formCubit.refresh();

      formCubit.state.errors.forEach((key, value) => expect(value, isEmpty));
      expect(formCubit.state.status, FormStatus.enable);
    });

    test('loadingFrom should update the status to loading', () {
      final formCubit = TestFormCubit();

      formCubit.loading();

      expect(formCubit.state.status, FormStatus.loading);
    });
  });
}
