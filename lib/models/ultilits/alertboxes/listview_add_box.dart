import 'package:flutter/material.dart';
import 'package:to_do_list/database/item.dart';
import 'package:to_do_list/models/ultilits/inputs/input.dart';

class AlertBox extends StatefulWidget {
  const AlertBox({Key? key}) : super(key: key);

  @override
  State<AlertBox> createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  final _titleCtrl = TextEditingController();
  final _contentCtrl = TextEditingController();
  final keyboard = TextInputType.visiblePassword;
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      title: Text(
        ':Nova nota:',
        style: TextStyle(color: Theme.of(context).primaryColor),
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
          Visibility(
            child: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'Os campos devem ser preenchidos!',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 13
                ),
              ),
            ),
            visible: _validate,
          ),
        ],
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.red),
          ),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.transparent),
          ),
        ),
        OutlinedButton(
          onPressed: () => _submit(),
          child: const Text(
            'Salvar',
            style: TextStyle(color: Colors.green),
          ),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.transparent),
          ),
        ),
      ],
    );
  }

  void _submit() {
    setState(() {
      _validate = false;
    });
    final title = _titleCtrl.text;
    final content = _contentCtrl.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      final item = Item(
        title: title,
        content: content,
      );
      Navigator.of(context).pop(item);
    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}
