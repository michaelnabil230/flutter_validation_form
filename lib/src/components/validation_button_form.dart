import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidationButtonForm<B extends StateStreamable<S>, S>
    extends BlocBuilderBase<B, S> {
  const ValidationButtonForm({
    required this.builder,
    super.key,
    super.bloc,
    super.buildWhen,
  });

  final BlocWidgetBuilder<S> builder;

  @override
  Widget build(BuildContext context, S state) => builder(context, state);
}
