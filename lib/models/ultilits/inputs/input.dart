import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hintText;

  const Input({
    Key? key,
    required this.controller,
    this.label,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autocorrect: true,
      enableSuggestions: false,
      style: TextStyle(color:Theme.of(context).primaryColor,fontSize: 18),
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
      ),
    );
  }
}
