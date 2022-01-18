import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/models/alertboxes/add_alertbox.dart';
import 'package:to_do_list/models/alertboxes/info_alert.box.dart';
import 'package:to_do_list/models/floating.button.dart';
import 'package:to_do_list/models/menu.dart';
import 'package:to_do_list/models/item.dart';

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
  List<Item> _items = [];
  final newTaskCrtl = TextEditingController();

  @override
  void didChangeDependencies() {
    _load();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Notes"),
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
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            return Dismissible(
              child: CheckboxListTile(
                title: Text(
                  item.title!,
                ),
                subtitle: Text(item.content!,
                    style: (Theme.of(context).textTheme.bodyText1)),
                onChanged: (value) {
                  setState(
                        () {
                      item.done = value!;
                      _save();
                    },
                  );
                },
                value: item.done,
              ),
              key: Key(item.title!),
              onDismissed: (direction) {
                _remove(index);
              },
              background: Container(
                child: const Text(
                  'Excluir',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                color: Theme.of(context).primaryColorLight,
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingButton(
        onPressed: () => _add(),
        onPressedInfo: () => _showDialog(),
        onPressedDelete: () => _deleteCheckedItems(),
      ),
    );
  }

  void _deleteCheckedItems() async {
    List<Item> _checkedItems = [];

    for (var item in _items) {
      bool isChecked = item.done == true;

      if (isChecked) _checkedItems.add(item);
    }

    if (_checkedItems.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Por favor, selecione ao menos um item para ser deletado.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              )
            ],
          );
        },
      );
      return; // para a execução do código
    }

    setState(() {
      for (var element in _checkedItems) {
        _items.remove(element);
      }
    });

    await _save();
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const InfoBox();
      },
    );
  }

  Future<void> _add() async {
    final response = await showDialog(
      context: context,
      builder: (contextDialog) => const AlertBox(),
    );

    if (response is Item) {
      setState(() {
        _items.add(response);
      });

      var prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        'data',
        jsonEncode(_items),
      );
    }
  }

  void _remove(int index) {
    setState(() {
      _items.removeAt(index);
      _save();
    });
  }

  Future _load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');

    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<Item> result = decoded.map((x) {
        return Item.fromJson(x);
      }).toList();
      setState(() {
        _items = result;
      });
    }
  }

  Future<void> _save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'data',
      jsonEncode(_items),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.white),
    );
  }
}
