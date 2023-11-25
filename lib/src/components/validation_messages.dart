import 'package:flutter/material.dart';
import 'package:validation_form/src/types/index.dart';

class ValidationMessages extends StatefulWidget {
  final Widget child;

  final Map<String, ValidationMessage> messages;

  const ValidationMessages({
    super.key,
    required this.messages,
    required this.child,
  });

  static State<ValidationMessages> of(BuildContext context) {
    final State<ValidationMessages>? result =
        context.findAncestorStateOfType<State<ValidationMessages>>();

    if (result != null) {
      return result;
    }

    throw FlutterError(
        'State<ValidationMessages> operation requested with a context that does not include a State<ValidationMessages>.\n'
        'The context used to show State<ValidationMessages> must be that of a widget '
        'that is a descendant of a State<ValidationMessages> widget.');
  }

  @override
  State<ValidationMessages> createState() => _ValidationMessagesState();
}

class _ValidationMessagesState extends State<ValidationMessages> {
  @override
  Widget build(BuildContext context) => widget.child;
}
