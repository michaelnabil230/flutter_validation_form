import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validation_form/validation_form.dart';

class ValidationTextField extends StatefulWidget {
  final FieldCubit cubit;

  final TextEditingController? controller;

  final Widget Function(
    BuildContext context,
    TextEditingController controller,
    FieldState state,
  ) field;

  const ValidationTextField({
    super.key,
    required this.cubit,
    this.controller,
    required this.field,
  });

  @override
  State<ValidationTextField> createState() => _ValidationTextFieldState();
}

class _ValidationTextFieldState extends State<ValidationTextField> {
  late TextEditingController _controller;

  late StreamSubscription _subscription;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _controller.text = widget.cubit.state.initialValue;
    _controller.addListener(_controllerListener);
    _subscription = widget.cubit.stream.listen(_cubitListener);
    super.initState();
  }

  void _cubitListener(FieldState state) {
    if (state.status.isInitial) {
      _controller.removeListener(_controllerListener);
      _controller.text = state.value;
      _controller.addListener(_controllerListener);
    }
  }

  void _controllerListener() {
    widget.cubit.setValue(_controller.text);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldCubit, FieldState>(
      bloc: widget.cubit,
      builder: (context, state) => widget.field(context, _controller, state),
    );
  }
}
