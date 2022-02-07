import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/database/calendar_items.dart';
import 'package:to_do_list/models/ultilits/Spacement/spacement.dart';
import 'package:to_do_list/models/ultilits/inputs/input.dart';
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
      return const Icon(Icons.arrow_circle_down_rounded);
    } else {
      return Icon(_icon,);
    }
  }

  getIconTitleCondition() {
    if (_icon == null) {
      return const Text('Selecione um icone:',style: TextStyle(fontSize: 18),);
    } else {
      return const Text('Icone selecionado:',style: TextStyle(fontSize: 18),);
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
          Row(
            children: [
              const Text('Data selecionada:', style: TextStyle(fontSize: 18),),
              const SizedBox(width: 15,),
              TextButton(
                onPressed: () => _selectDate(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.redAccent),
                ),
                child: Text(
                  DateFormat('dd/MM/yyyy').format(selectedDate),
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
          Row(
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
          const Spacement(height: 15,),
          Input(
            label: 'Descrição:',
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
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
        Center(
          child: Image.asset(
            'assets/image/present.gif',
            width: 100,
            height: 100,
          ),
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
