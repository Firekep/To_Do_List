import 'package:flutter/material.dart';
import 'package:to_do_list/models/item.dart';
import 'package:to_do_list/models/input.dart';

class AlertBox extends StatefulWidget {
  const AlertBox({Key? key}) : super(key: key);

  @override
  State<AlertBox> createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  final _titleCtrl = TextEditingController();
  final _contentCtrl = TextEditingController();
  final keyboard = TextInputType.visiblePassword;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        ':Nova nota:',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Input(
            label: 'Título:',
            controller: _titleCtrl,
          ),
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
    final title = _titleCtrl.text;
    final content = _contentCtrl.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      final item = Item(
        title: title,
        content: content,
      );
      Navigator.of(context).pop(item);
    }
  }
}
