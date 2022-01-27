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
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
        // OutlinedButton(
        //     onPressed: () {},
        //     child: const Icon(
        //       Icons.delete,
        //       color: Colors.white,
        //     ))
      ],
    );
  }
}
