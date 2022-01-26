import 'package:flutter/material.dart';

class Spacement extends StatelessWidget {
  final double height;
  const Spacement({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,);
  }
}
