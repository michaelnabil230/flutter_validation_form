import 'package:flutter_test/flutter_test.dart';
import 'package:validation_form/validation_form.dart';

void main() {
  group('FieldCubit', () {
    late FieldCubit fieldCubit;
    late Required mockRequiredRule;

    setUp(() {
      mockRequiredRule = Required();
      fieldCubit = FieldCubit(
        context: null,
        attribute: 'name',
        initialValue: '',
        rules: () => [mockRequiredRule],
      );
    });

    tearDown(() {
      fieldCubit.close();
    });

    test('should be initialized with default values', () {
      expect(fieldCubit.state.attribute, 'name');
      expect(fieldCubit.state.initialValue, isEmpty);
      expect(fieldCubit.state.value, isEmpty);
    });

    test('setValue should update the value and run validation', () {
      fieldCubit.setValue('John');

      expect(fieldCubit.state.value, 'John');
      expect(fieldCubit.state.errors, isEmpty);
    });

    test('errorsCheck should run validation and update errors', () {
      fieldCubit.setValue('');
      fieldCubit.errorsCheck();

      expect(fieldCubit.state.errors, [mockRequiredRule.error]);
    });

    test('reset should reset the state to initial values', () {
      fieldCubit.setValue('John');
      fieldCubit.errorsCheck();
      fieldCubit.reset();

      expect(fieldCubit.state.value, isEmpty);
      expect(fieldCubit.state.status, FieldStatus.initial);
      expect(fieldCubit.state.errors, isEmpty);
    });

    test('addErrors should update the errors in the state', () {
      fieldCubit.addErrors(['Invalid name']);

      expect(fieldCubit.state.errors, ['Invalid name']);
    });

    test('runValidation should return errors based on rule validation', () {
      fieldCubit.setValue('');
      final errors = fieldCubit.runValidation(fieldCubit.state.value);

      expect(errors, [mockRequiredRule.error]);
    });

    test('toString should generate a readable representation', () {
      expect(
        fieldCubit.toString(),
        'FieldCubit(attribute: name, initialValue: , rules: Closure: () => List<Rule>, validationMessages: {})',
      );
    });
  });
}
