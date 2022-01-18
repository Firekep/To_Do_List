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
      title: const Text(
        'Como usar?',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.pink),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              '- Para adicionar um novo conteúdo aperte o botão "+".',
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
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              '-Caso queira trocar o tema da aplicação aperte no botão superior esquerdo, em seguida "tema".',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Fechar',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
