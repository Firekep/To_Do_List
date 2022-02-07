import 'package:flutter/material.dart';

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          children: <Widget>[
            RawMaterialButton(
              autofocus: false,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: onPressedInfo,
              elevation: 2.0,
              fillColor: Theme.of(context).shadowColor,
              child: const Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 35.0,
              ),
              padding: const EdgeInsets.all(15.0),
              shape: const CircleBorder(),
            ),
            RawMaterialButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: onPressed,
              elevation: 2.0,
              fillColor: Theme.of(context).shadowColor,
              child: const Icon(
                Icons.add,
                size: 35.0,
                  color: Colors.white,
              ),
              padding: const EdgeInsets.all(15.0),
              shape: const CircleBorder(),
            ),
            RawMaterialButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              fillColor: Theme.of(context).shadowColor,
              onPressed: onPressedDelete,
              elevation: 2.0,
              child: const Icon(
                Icons.delete,
                size: 35.0, color: Colors.white,
              ),
              padding: const EdgeInsets.all(15.0),
              shape: const CircleBorder(),
            )
          ],
        ),
      ],
    );
  }
}
