import 'package:flutter/material.dart';
import 'package:to_do_list/models/input.dart';

import '../calendar_items.dart';

class CalendarAdd extends StatefulWidget {
  const CalendarAdd({Key? key}) : super(key: key);

  @override
  State<CalendarAdd> createState() => _CalendarAddState();
}

class _CalendarAddState extends State<CalendarAdd> {
  late final String data;
  final _contentCtrl = TextEditingController();
  final keyboard = TextInputType.visiblePassword;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        data ,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Input(
            label: 'Conteúdo:',
            controller: _contentCtrl,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () => _submit(),
          child: const Text(
            'Salvar',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }

  void _submit() {
    final content = _contentCtrl.text;

    if (content.isNotEmpty && content.isNotEmpty) {
      final item = CalendarItem(
        content: content,
      );
      Navigator.of(context).pop(item);
    }
  }
}
