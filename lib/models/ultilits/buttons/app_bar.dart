import 'package:flutter/material.dart';

class AppBottomBar extends StatelessWidget {
  final void Function() onPressed;

  const AppBottomBar({
    Key? key,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.transparent),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
      ],
    );
  }
}
