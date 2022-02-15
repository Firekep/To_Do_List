import 'package:flutter/material.dart';

class InfoBox extends StatefulWidget {
  const InfoBox({Key? key}) : super(key: key);

  @override
  State<InfoBox> createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      title: const Text(
        'Como usar?',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.pink),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '----------------------------------------------------------',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            Text(
              '-Novo!: \n\n'
                  '-Para editar uma nota, basta clicar nela.',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                    '-Descrição agora pode ser econdido.',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Text(
                  '-A ordem da lista agora pode ser alterada, basta clicar no item e segura-lo.',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                '----------------------------------------------------------',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                '- Para excluir apenas um elemento segure e arraste o bloco para qualquer direção.',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                '-Para excluir vários elementos da lista aperte no botão da lixeira, e todos os itens marcados como "concluido" serão apagados.',
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
