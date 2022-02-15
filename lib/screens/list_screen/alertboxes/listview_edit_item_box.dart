import 'package:flutter/material.dart';
import 'package:to_do_list/screens/list_screen/memory/list_item.dart';
import 'package:to_do_list/models/ultilits/Spacement/spacement.dart';

class EditBox extends StatefulWidget {
  final Item item;
  const EditBox({
    Key? key,
    required this.item
  }) : super(key: key);

  @override
  _EditBoxState createState() => _EditBoxState();
}

class _EditBoxState extends State<EditBox> {
  bool _isEditingText = false;
  TextEditingController _titleCtrl = TextEditingController();
  TextEditingController _contentCtrl = TextEditingController();
  String initialTitleText = '';
  bool _validate = false;

  @override
  void initState() {
    super.initState();
    _titleCtrl = TextEditingController(text: '${widget.item.title}');
    _contentCtrl = TextEditingController(text: '${widget.item.content}');
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return antigo(context);
  }

  AlertDialog antigo(BuildContext context)  {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
    title: Center(
        child: Text(
          'Editar!',
          style: TextStyle(
              fontSize: 35,
            color: Theme.of(context).primaryColor,
          ),
        ),
    ),
    content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          header(context),
          titleField(context),
          const Spacement(height:30),
          contentField(context),
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
    ),
    actions: <Widget>[
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
  );
  }

  Container contentField(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).hoverColor,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Descrição:',
                  style: TextStyle(fontSize: 22,
                      color: Theme.of(context).primaryColor,
                  ),
                )

              ],
            ),
            Center(
              child: TextField(
                onSubmitted: (newValue){
                  setState(() {
                    initialTitleText = newValue;
                    _isEditingText = false;
                  });
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
                autofocus: false,
                controller: _contentCtrl,
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).primaryColor,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );
  }

  Container titleField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).hoverColor,
      ),
      child: Column(
          children: [
            Center(
              child: TextField(
                onSubmitted: (newValue){
                  setState(() {
                    initialTitleText = newValue;
                    _isEditingText = false;
                  });
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                style: TextStyle(
                    fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                autofocus: false,
                controller: _titleCtrl,
              ),
            ),
          ],
        ),
      );
  }

  Column header(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Image.asset(
              'assets/image/EditScreen.png',
              width: 150,
              height: 150,
            )),
        const Spacement(height: 10),
      ],
    );
  }

  void _submit() {
    setState(() {
      _validate = false;
    });
    final title = _titleCtrl.text;
    final content = _contentCtrl.text;

    if (title.isNotEmpty) {
      final item = Item(
        title: title,
        content: content,
      );
      Navigator.of(context).pop(item);
    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}
