import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

class TestFormCubit extends FormCubit {
  late FieldCubit field1;

  late FieldCubit field2;

  @override
  List<FieldCubit> initializeFields(_) {
    field1 = FieldCubit(
      context: null,
      attribute: 'field1',
      rules: () => [Validations.required],
    );
    field2 = FieldCubit(
      context: null,
      attribute: 'field2',
      rules: () => [Validations.required],
    );

    return [field1, field2];
  }
}

class TestForm2Cubit extends FormCubit {
  late FieldCubit field1;

  late FieldCubit field2;

  @override
  bool get isEdit => true;

  @override
  List<FieldCubit> initializeFields(_) {
    field1 = FieldCubit(
      context: null,
      attribute: 'field1',
      rules: () => [Validations.required],
    );
    field2 = FieldCubit(
      context: null,
      attribute: 'field2',
      rules: () => [Validations.required],
    );

    return [field1, field2];
  }
}

void main() {
  group('FormCubit', () {
    test('should be initialized with default values', () {
      final formCubit = TestFormCubit()..initialize();

      expect(formCubit.state.status, FormStatus.disable);
      expect(formCubit.isEdit, isFalse);
      expect(formCubit.fields.length, 2);
    });

    test('should be is edit', () {
      final formCubit = TestForm2Cubit();

      expect(formCubit.isEdit, isTrue);
    });

    test('tests for status', () {
      final formCubitDisable = TestFormCubit()..disable();
      expect(formCubitDisable.isDisable, isTrue);
      expect(formCubitDisable.canSubmit, isTrue);
      expect(formCubitDisable.status, FormStatus.disable);

      final formCubitLoading = TestFormCubit()..loading();
      expect(formCubitLoading.isLoading, isTrue);
      expect(formCubitLoading.canSubmit, isTrue);
      expect(formCubitLoading.status, FormStatus.loading);

      final formCubitEnable = TestFormCubit()..enable();
      expect(formCubitEnable.isEnable, isTrue);
      expect(formCubitEnable.canSubmit, isFalse);
      expect(formCubitEnable.status, FormStatus.enable);
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

      formCubit.errors.forEach((key, value) => expect(value, isEmpty));
      expect(formCubit.state.status, FormStatus.enable);
    });

    test('loadingFrom should update the status to loading', () {
      final formCubit = TestFormCubit();

      formCubit.loading();

      expect(formCubit.state.status, FormStatus.loading);
    });
  });
}
