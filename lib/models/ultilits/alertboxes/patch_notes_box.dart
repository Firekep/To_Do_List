import 'package:flutter/material.dart';

class PatchNotes extends StatelessWidget {
  const PatchNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      title: const Text(
        'Patch Notes',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.pink),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Text('Versão 3.0.0.5'),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.black,
              width: 1.2,
            ))),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: const Text(
                'Calendário:                                                      '
                'Data agora pode ser marcada ao ser apertado e segurado.'),
          ),
          Container(
            child:
                const Text('Adição de seleção de icone na lista do calendário.'),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.black,
              width: 1.2,
            ))),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: const Text(
                'Geral:                                                      '
                    'Agora ao adicionar um item a lista ou ao calendário, aparecerá uma mensagem caso algum campo esteja vazio!'),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.2,
                    ))),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: const Text(
                'Tema:                                                      '
                    'Algumas cores foram alteradas!(Não espere muita coisa hehe..)'),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.2,
                    ))),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: const Text(
                'Aviso:                                                      '
                    'Devido a alta mudança de códigos muito provavél possa ser perdido algum arquivo, kk sinto muito.'),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.2,
                    ))),
          ),
        ],
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Fechar',
            style: TextStyle(color: Colors.red),
          ),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.transparent),
          ),
        ),
      ],
    );
  }
}
