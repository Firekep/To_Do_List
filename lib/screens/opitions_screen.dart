import 'package:flutter/material.dart';
import 'package:to_do_list/models/ultilits/Spacement/spacement.dart';

import 'geral_view/appbar_config/slide.switch.dart';

class OpitionsPage extends StatefulWidget {
  final void Function(bool value) onChangeTheme;
  final bool isLightTheme;

  const OpitionsPage({
    Key? key,
    required this.isLightTheme,
    required this.onChangeTheme,
  }) : super(key: key);

  @override
  _OpitionsPageState createState() => _OpitionsPageState();
}

class _OpitionsPageState extends State<OpitionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SlideSwitch(
                text: 'Tema',
                value: widget.isLightTheme,
                onChange: (value) {
                  setState(() {
                    widget.onChangeTheme(value);
                  });
                },
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).hoverColor,
              ),
            ),
            const Spacement(height: 32.0,),
            Text(
              'Versão:  4.0.0+5',
              style: TextStyle(color: Theme.of(context).primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
