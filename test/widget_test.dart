//  flutter build apk --split-per-abi --no-tree-shake-icons

// versão 3.0.0+5
//          Container(
//             padding: const EdgeInsets.symmetric(vertical: 20.0),
//             child: Text(
//               'Calendário:                                                      '
//               'Data agora pode ser marcada ao ser apertado e segurado.',
//               style: TextStyle(color: Theme.of(context).primaryColor),
//             ),
//           ),
//           Container(
//             child: Text(
//               'Adição de seleção de icone na lista do calendário.',
//               style: TextStyle(color: Theme.of(context).primaryColor),
//             ),
//             decoration: const BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//               color: Colors.black,
//               width: 1.2,
//             ))),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 20.0),
//             child: Text(
//               'Geral:\n'
//               'Agora ao adicionar um item a lista ou ao calendário, aparecerá uma mensagem caso algum campo esteja vazio!',
//               style: TextStyle(color: Theme.of(context).primaryColor),
//             ),
//             decoration: const BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//               color: Colors.black,
//               width: 1.2,
//             ))),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 20.0),
//             child: Text(
//               'Tema:\n'
//               'Algumas cores foram alteradas!(Não espere muita coisa hehe..)',
//               style: TextStyle(color: Theme.of(context).primaryColor),
//             ),
//             decoration: const BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//               color: Colors.black,
//               width: 1.2,
//             ))),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 20.0),
//             child: Text(
//               'Aviso:\n'
//               'Devido a alta mudança de códigos muito provavél possa ser perdido algum arquivo, kk sinto muito.',
//               style: TextStyle(color: Theme.of(context).primaryColor),
//             ),
//             decoration: const BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//               color: Colors.black,
//               width: 1.2,
//             ))),
//           ),

//                //   showModalBottomSheet<void>(
//                 //   context: context,
//                 //   builder: (BuildContext context) {
//                 //     return EditBox(
//                 //       item: item,
//                 //     );
//                 //   },
//                 // );

//SizedBox novo(BuildContext context) {
//     return SizedBox(
//     height: double.infinity,
//     child: Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             header(context),
//             Container(
//               // padding: const EdgeInsets.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                 color: Theme.of(context).hoverColor,
//               ),
//               child: Column(
//                 children: [
//                   Center(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(10),
//                         color: Theme.of(context).hoverColor,
//                       ),
//                       child: TextField(
//                         keyboardType: TextInputType.multiline,
//                         maxLines: null,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           focusedBorder: InputBorder.none,
//                           enabledBorder: InputBorder.none,
//                           errorBorder: InputBorder.none,
//                           disabledBorder: InputBorder.none,
//                         ),
//                         style: const TextStyle(
//                             fontSize: 20
//                         ),
//                         onSubmitted: (newValue){
//                           setState(() {
//                             initialTitleText = newValue;
//                             _isEditingText = false;
//                           });
//                         },
//                         autofocus: false,
//                         controller: _titleCtrl,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Spacement(height: 40),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(10),
//                 color: Theme.of(context).hoverColor,
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     children: const [
//                       Text(
//                         'Descrição:',
//                         style: TextStyle(fontSize: 25),
//                       )
//
//                     ],
//                   ),
//                   Center(
//                     child: TextField(
//                       onSubmitted: (newValue){
//                         setState(() {
//                           initialTitleText = newValue;
//                           _isEditingText = false;
//                         });
//                       },
//                       decoration: const InputDecoration(
//                         border: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         enabledBorder: InputBorder.none,
//                         errorBorder: InputBorder.none,
//                         disabledBorder: InputBorder.none,
//                       ),
//                       autofocus: false,
//                       controller: _contentCtrl,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Visibility(
//               child: const Padding(
//                 padding: EdgeInsets.only(top: 8.0),
//                 child: Text(
//                   'Os campos devem ser preenchidos!',
//                   style: TextStyle(
//                       color: Colors.red,
//                       fontSize: 13
//                   ),
//                 ),
//               ),
//               visible: _validate,
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
//   }