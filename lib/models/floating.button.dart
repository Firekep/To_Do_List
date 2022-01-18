import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FloatingButton extends StatelessWidget {
  final void Function() onPressed;
  final void Function() onPressedInfo;
  final void Function() onPressedDelete;

  const FloatingButton({
    Key? key,
    required this.onPressed,
    required this.onPressedInfo,
    required this.onPressedDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.info),
          onPressed: onPressedInfo,
        ),
        FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: onPressed,
        ),
        FloatingActionButton(
          child: const Icon(Icons.delete),
          onPressed: onPressedDelete,
        ),
      ],
    );
  }
}
