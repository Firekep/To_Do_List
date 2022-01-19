import 'package:flutter/material.dart';
import 'package:to_do_list/models/slide.switch.dart';

class Menu extends StatefulWidget {
  final void Function(bool value) onChangeTheme;
  final bool isLightTheme;


  const Menu({
    Key? key,
    required this.isLightTheme,
    required this.onChangeTheme,
  }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.menu),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          child: StatefulBuilder(
            builder: (context, setState) {
              return SlideSwitch(
                text: 'Tema',
                value: widget.isLightTheme,
                onChange: (value) {
                  setState(() {
                    widget.onChangeTheme(value);
                  });
                },
              );
            },
          ),
        ),
        PopupMenuItem(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: StatefulBuilder(
            builder: (context, setState) {
              return const Text('Como usar?');
            },
          ),
        ),
      ],
    );
  }
}
