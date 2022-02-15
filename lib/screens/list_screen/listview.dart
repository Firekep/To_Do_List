import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/screens/list_screen/memory/list_item.dart';
import 'alertboxes/listview_add_box.dart';
import 'alertboxes/listview_delete_info_box.dart';
import 'alertboxes/listview_edit_item_box.dart';
import 'alertboxes/listview_info_box.dart';
import 'button/list_view_button.dart';


class Listview extends StatefulWidget {
  const Listview({Key? key}) : super(key: key);

  @override
  _ListviewState createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  List<Item> _items = [];
  final newTaskCrtl = TextEditingController();
  bool _showContent = true;

  @override
  void didChangeDependencies() {
    _load();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ListViewButton(
        onPressedDelete: () => _deleteCheckedItems(),
        onPressed: () => _addListItem(),
        onPressedInfo: () => _showInfoBox(),
        onPressedShowContent: () {_saveVisible();},
      ),
      body: body(context),
    );
  }

  ReorderableListView body(BuildContext context) {
    return ReorderableListView(
      onReorder: _onReorder,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: List.generate(_items.length, (index) {
        final item = _items[index];
        return GestureDetector(
          key: Key('$index'),
          child: Dismissible(
            child: Container(
              child: ListTile(
                  title: Text(
                    item.title!,
                    style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Visibility(
                    visible: _showContent,
                    child: Text(
                      item.content!,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  leading: Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    value: item.done,
                    onChanged: (value) {
                      setState(() {
                        item.done = value;
                      });
                      // mudar state
                    },
                  ),
                  onTap: () => _editItem(item, index)),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 1.2),
                ),
              ),
            ),
            background: primaryBackground(context),
            secondaryBackground: secondaryBackground(context),
            key: Key(item.title!),
            onDismissed: (direction) {
              _removeItemList(index);
            },
          ),
        );
      }),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.white),
    );
  }

  Container primaryBackground(BuildContext context) {
    return Container(
        child: const Icon(
          Icons.arrow_forward_outlined,
        ),
        color: Theme.of(context).backgroundColor);
  }

  Container secondaryBackground(BuildContext context) {
    return Container(
      child: const Icon(
        Icons.arrow_back_outlined,
      ),
      color: Theme.of(context).backgroundColor,
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(
      () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final Item item = _items.removeAt(oldIndex);
        _items.insert(newIndex, item);
        _saveCurrentState();
      },
    );
  }

  void _deleteCheckedItems() async {
    print('delete: ok');
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

    await _saveCurrentState();
  }

  void _showInfoBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const InfoBox();
      },
    );
  }

  void _removeItemList(int index) {
    setState(() {
      _items.removeAt(index);
      _saveCurrentState();
    });
  }

  Future _load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');
    var visible = prefs.getBool('visible');

    setState(() {
      if(visible == false){
        _showContent = false;
      } else {
        _showContent = true;
      }
    });


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

  Future<void> _saveVisible() async {
    setState(() {
      _showContent = !_showContent;
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('visible', _showContent);
    } catch (error) {
      if (kDebugMode) {
        print('visible');
      }
    }
  }

  Future<void> _editItem(Item item, int index) async {
    final response = await showDialog(
      context: context,
      builder: (contextDialog) => EditBox(item: item),
    );

    if (response is Item) {
      setState(() {
        _items.removeAt(index);
        _items.insert(index, response);
      });

      var prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        'data',
        jsonEncode(_items),
      );
    }
  }

  Future<void> _addListItem() async {
    final response = await showDialog(
      context: context,
      builder: (contextDialog) => const AlertBox(),
    );

    if (response is Item) {
      setState(() {
        _items.add(response);
        print('response: $response');
      });

      var prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        'data',
        jsonEncode(_items),
      );
    }
  }

  Future<void> _saveCurrentState() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'data',
      jsonEncode(_items),
    );
  }
}
