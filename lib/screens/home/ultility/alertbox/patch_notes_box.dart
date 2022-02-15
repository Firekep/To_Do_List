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
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Versão 4.0.0+5',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.black,
                width: 1.2,
              ))),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Calendário:                                                      '
                'Addbox foi melhorado e estilizado',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Correção visual do bug de marcação dupla.',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Correção de atualização do calendário ao um item ser removido.',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 1.2,
                      ))),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Lista:\n'
                    'Botões de ações agora são exibidos de maneira difirente.',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Agora é possivél editar as notas apenas ao clique.',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Cor e formato do CheckBox foram mudados e melhorados',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Cor e formato do CheckBox foram mudados e melhorados',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 1.2,
                      ))),
              child: Text(
                'O campo "Descrição" não é mais obrigatório para a criação de um item',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    'PatchNotes:\n'
                    'Correção de cores',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.black,
                width: 1.2,
              ))),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 1.2,
                      ))),
              child: Text(
                'Sistema:\n'
                'Compnonetização do aplicativo foi melhorada e organizada',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
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
