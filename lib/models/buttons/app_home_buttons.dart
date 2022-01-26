import 'package:flutter/material.dart';
import 'package:to_do_list/screens/calculator.dart';
import 'package:to_do_list/screens/calendar.dart';
import 'package:to_do_list/screens/listview.dart';

class AppHomeButtons extends StatefulWidget {
  const AppHomeButtons({Key? key}) : super(key: key);

  @override
  _AppHomeButtonsState createState() => _AppHomeButtonsState();
}

class _AppHomeButtonsState extends State<AppHomeButtons> {
  @override
  Widget build(BuildContext context) {
    return  Wrap(
      children: <Widget>[
        RawMaterialButton(
          autofocus: false,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Listview(),
              ),
            );
          },
          elevation: 2.0,
          fillColor: Theme.of(context).buttonColor,
          child: const Icon(
            Icons.list_alt_outlined,
            size: 35.0,
          ),
          padding: const EdgeInsets.all(15.0),
          shape: const CircleBorder(),
        ),
        RawMaterialButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Calculator(),
              ),
            );
          },
          elevation: 2.0,
          fillColor: Theme.of(context).buttonColor,
          child: const Icon(
            Icons.calculate,
            size: 35.0,
          ),
          padding: const EdgeInsets.all(15.0),
          shape: const CircleBorder(),
        ),
        RawMaterialButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Calendar(),
              ),
            );
          },
          elevation: 2.0,
          fillColor: Theme.of(context).buttonColor,
          child: const Icon(
            Icons.calendar_today_outlined,
            size: 35.0,
          ),
          padding: const EdgeInsets.all(15.0),
          shape: const CircleBorder(),
        ),
      ],
    );
  }
}
