import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/database/calendar_items.dart';
import 'package:to_do_list/models/ultilits/inputs/input.dart';

class CalendarAddByDateTime extends StatefulWidget {
  final DateTime selectedDay;

  const CalendarAddByDateTime({Key? key,
    required this.selectedDay,
  }) : super(key: key);

  @override
  State<CalendarAddByDateTime> createState() => _CalendarAddByDateTimeState();
}

class _CalendarAddByDateTimeState extends State<CalendarAddByDateTime> {
  final _contentCtrl = TextEditingController();
  final keyboard = TextInputType.visiblePassword;
  DateTime selectedDate = DateTime.now();
  final myController = TextEditingController();

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
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color.fromRGBO(0, 127, 255, 1),),
            ),
            child: Text(
              DateFormat('dd/MM/yyyy').format(widget.selectedDay),
              style: TextStyle(color: Theme.of(context).primaryColor),
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
          child: Image.asset(
            'assets/image/present.gif',
            width: 150,
            height: 150,
          ),
        ),
      ],
    );
  }

  void _submit() {
    final content = _contentCtrl.text;

    if (content.isNotEmpty) {
      final item = CalendarItem(
        content: content,
        date: widget.selectedDay,
      );
      Navigator.of(context).pop(item);
    }
  }
}
