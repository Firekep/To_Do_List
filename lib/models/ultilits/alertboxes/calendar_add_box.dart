import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/database/calendar_items.dart';
import 'package:to_do_list/models/ultilits/inputs/input.dart';

class CalendarAdd extends StatefulWidget {
  const CalendarAdd({Key? key}) : super(key: key);

  @override
  State<CalendarAdd> createState() => _CalendarAddState();
}

class _CalendarAddState extends State<CalendarAdd> {
  final _contentCtrl = TextEditingController();
  final keyboard = TextInputType.visiblePassword;
  DateTime? selectedDate;
  final myController = TextEditingController();

  String getText() {
    if (selectedDate == null) {
      return 'Selecione uma data';
    } else {
      return DateFormat('dd/MM/yyyy').format(selectedDate!);
      // return '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      title: Text(
        'Adcionando um lembrete',
        style: TextStyle(color: Theme.of(context).primaryColor),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () => _selectDate(context),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.redAccent),
            ),
            child: Text(
              getText(),style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          Input(
            label: 'Descrição:',
            controller: _contentCtrl,
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
        ),
        Center(
          child: Image.asset('assets/image/present.gif',width: 150,height: 150,),
        ),
      ],
    );
  }

  void _submit() {
    final content = _contentCtrl.text;
    final data = getText().toString();

    if (content.isNotEmpty && data.isNotEmpty) {
      final item = CalendarItem(
        content: content,
        date : data,
      );
      Navigator.of(context).pop(item);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? initialDate,
        firstDate: DateTime(2001, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
