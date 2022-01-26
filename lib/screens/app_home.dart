import 'package:flutter/material.dart';
import 'package:to_do_list/models/alertboxes/add_alertbox.dart';
import 'package:to_do_list/models/buttons/app_home_buttons.dart';
import 'package:to_do_list/models/menu.dart';
import 'package:to_do_list/models/Spacement/spacement.dart';

class AppHome extends StatefulWidget {
  final void Function(bool value) onChangeTheme;
  final bool isLightTheme;

  const AppHome({
    Key? key,
    required this.isLightTheme,
    required this.onChangeTheme,
  }) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Notes!'),
        leading: Builder(
          builder: (BuildContext context) {
            return Menu(
              isLightTheme: widget.isLightTheme,
              onChangeTheme: (value) {
                widget.onChangeTheme(value);
              },
            );
          },
        ),
      ),
      body: Column(
        children: [
          const Spacement(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Escolha uma função:',
                style: TextStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          const Spacement(height: 100),
        const AppHomeButtons(),
          Center(
            child: Image.asset('assets/image/main.png',width: 150,height: 150,),
          ),
        ],
      ),
    );
  }
}
