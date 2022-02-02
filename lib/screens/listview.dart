import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/database/item.dart';
import 'package:to_do_list/models/ultilits/alertboxes/listview_add_box.dart';
import 'package:to_do_list/models/ultilits/alertboxes/listview_delete_info_box.dart';
import 'package:to_do_list/models/ultilits/alertboxes/listview_info_box.dart';
import 'package:to_do_list/models/ultilits/buttons/floating.button.dart';
import 'package:favorite_button/favorite_button.dart';

class Listview extends StatefulWidget {
  const Listview({Key? key}) : super(key: key);

  @override
  _ListviewState createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  List<Item> _items = [];
  final List<Item> _favoriteItem = [];
  final newTaskCrtl = TextEditingController();

  @override
  void didChangeDependencies() {
    _load();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return Dismissible(
          child: Container(
            child: CheckboxListTile(
              title: Text(
                item.title!,
                style: TextStyle(color: Theme.of(context).backgroundColor,fontSize: 18),
              ),
              secondary:  StarButton(
                iconColor: Theme.of(context).splashColor,
                iconSize: 35,
                isStarred: item.favorite,
                valueChanged: (value){
                  item.favorite = value!;
                  _save();
                },
              ),
              subtitle: Text(
                item.content!,
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 15),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(
                      () {
                    item.done = value!;
                    _save();
                    _favoriteItems();
                  },
                );
              },
              value: item.done,
            ),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 1.2))),
          ),
          key: Key(item.title!),
          onDismissed: (direction) {
            _remove(index);
          },
          background: Container(
              child: const Icon(Icons.arrow_forward_outlined),
              color: Theme.of(context).backgroundColor),
          secondaryBackground: Container(
            child: const Icon(
              Icons.arrow_back_outlined,
              size: 25,
            ),
            color: Theme.of(context).backgroundColor,
          ),
        );
      },
    ),
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
          return const DeleteInfoBox();
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

  void _favoriteItems() async{

    for(var item in _items){
      bool isFavorite = item.favorite == true;

      if (isFavorite) _favoriteItem.add(item);
    }
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
