import 'package:flutter/material.dart';
import 'package:to_do_list/screens/list_screen/memory/list_item.dart';
import 'package:to_do_list/models/ultilits/Spacement/spacement.dart';
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
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Input(
                label: 'Título:',
                controller: _titleCtrl,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).hoverColor,
              ),
            ),
            const Spacement(height: 10,),
            Container(
              child: Input(
                label: 'Descrição:',
                controller: _contentCtrl,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).hoverColor,
              ),
            ),
            Row(
              children: [
                Text('(Opcional)',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Visibility(
              child: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'O título deve ser preenchido!',
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

    if (title.isNotEmpty) {
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
