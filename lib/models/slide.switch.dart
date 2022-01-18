import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideSwitch extends StatelessWidget {
  final String? text;
  final bool value;
  final void Function(bool value) onChange;

  const SlideSwitch({
    Key? key,
    this.text,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if(text != null)
          Container(
            child: Text(text!),
          ),
        Switch(
          value: value,
          onChanged: onChange,
          activeTrackColor: Colors.yellow,
          activeColor: Colors.white38,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.black,
        ),
      ],
    );
  }
}