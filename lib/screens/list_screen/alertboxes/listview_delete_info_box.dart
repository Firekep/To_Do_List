import 'package:flutter/material.dart';

class DeleteInfoBox extends StatefulWidget {
  const DeleteInfoBox({Key? key}) : super(key: key);

  @override
  _DeleteInfoBoxState createState() => _DeleteInfoBoxState();
}

class _DeleteInfoBoxState extends State<DeleteInfoBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      title: Column(
        children: [
          Text(
              'Por favor, selecione ao menos um item para ser deletado.',style: TextStyle(color: Theme.of(context).primaryColor),),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Center(
            child: Image.asset('assets/image/interrogation.png',width: 150,height: 50,),
            ),
          ),
        ],
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'OK',
            style: TextStyle(color:Colors.red),
          ),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.transparent),
          ),
        )
      ],
    );
  }
}
