import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/screens/calendar/memory/calendar_items.dart';
import 'package:to_do_list/models/ultilits/Spacement/spacement.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class CalendarAdd extends StatefulWidget {
  const CalendarAdd({Key? key}) : super(key: key);

  @override
  State<CalendarAdd> createState() => _CalendarAddState();
}

class _CalendarAddState extends State<CalendarAdd> {
  final _contentCtrl = TextEditingController();
  final keyboard = TextInputType.visiblePassword;
  DateTime selectedDate = DateTime.now();
  final myController = TextEditingController();
  IconData? _icon;
  bool _validate = false;

  getIconTitle() {
    if (_icon == null) {
      return Icon(Icons.arrow_circle_down_rounded,color: Theme.of(context).splashColor);
    } else {
      return Icon(_icon,);
    }
  }

  getIconTitleCondition() {
    if (_icon == null) {
      return Text('Selecione um icone:',style: TextStyle(fontSize: 18,color: Theme.of(context).primaryColor),);
    } else {
      return Text('Icone selecionado:',style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Adcionando um lembrete',
        style: TextStyle(color: Theme.of(context).primaryColor),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: TextFormField(
              controller: _contentCtrl,
              autocorrect: true,
              enableSuggestions: false,
              style: TextStyle(color:Theme.of(context).primaryColor,fontSize: 18),
              decoration: const InputDecoration(
                labelText: 'Título:',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
            height: 55,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).hoverColor,
            ),
          ),
          const Spacement(height: 10),
          Container(
            child: Row(
              children: [
                Text('Data selecionada:', style: TextStyle(fontSize: 18,color: Theme.of(context).primaryColor),),
                TextButton(
                  onPressed: () => _selectDate(context),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.transparent),
                  ),
                  child: Text(
                    DateFormat('dd/MM/yyyy').format(selectedDate),
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
            padding: const EdgeInsets.all(10),
            height: 55,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).hoverColor,
            ),
          ),
          const Spacement(height: 10),
          Container(
            child: Row(
              children: [
                getIconTitleCondition(),
                TextButton(
                  onPressed: () {
                    _pickIcon();
                  },
                  child: getIconTitle(),
                ),
              ],
            ),
              padding: const EdgeInsets.all(10),
              height: 55,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).hoverColor,
              ),
          ),
          const Spacement(height: 15,),
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
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Image.asset(
                'assets/image/present.gif',
                width: 40,
                height: 40,
              ),
            ),
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.red),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.transparent),
              ),
            ),//Botão de cancelar
            OutlinedButton(
              onPressed: () => _submit(),
              child: const Text(
                'Salvar',
                style: TextStyle(color: Colors.green),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.transparent),
              ),
            ),//Botão de Salvar
          ],
        ),
      ],
      backgroundColor: Theme.of(context).cardColor,
    );
  }

  Future<void> _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(
      context,
      iconPackModes: [IconPack.material],
    );

    if (icon != null) {
      _icon = icon;

      setState(() {
        debugPrint('Picked Icon: ${icon.codePoint} Picked Icon:${icon.fontFamily} Picked Icon:${icon.fontPackage}');
      });
    }
  }

  void _submit() {
    setState(() {
      _validate = false;
    });

    final content = _contentCtrl.text;

    if (content.isNotEmpty) {
      final item = CalendarItem(
          content: content,
          date: selectedDate,
          iconCodePoint: _icon?.codePoint,
      );
      Navigator.of(context).pop(item);
    } else {
      setState(() {
        _validate = true;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2001, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
