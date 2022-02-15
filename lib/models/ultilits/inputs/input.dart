import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hintText;
  final int? maxLength;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? border;

  const Input({
    Key? key,
    required this.controller,
    this.label,
    this.hintText,
    this.maxLength,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.disabledBorder,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      keyboardType: TextInputType.multiline,
      controller: controller,
      autocorrect: true,
      enableSuggestions: false,
      style: TextStyle(color:Theme.of(context).primaryColor,fontSize: 18),
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
      ],
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: border,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        errorBorder: errorBorder,
        disabledBorder: disabledBorder,
      ),
    );
  }
}
