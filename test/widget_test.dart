// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:to_do_list/my_app.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

//import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:to_do_list/models/memory.dart';
//
//
// class Calculator extends StatefulWidget {
//   const Calculator({Key? key}) : super(key: key);
//
//   @override
//   _CalculatorState createState() => _CalculatorState();
// }
//
// class _CalculatorState extends State<Calculator> {
//   final _memory = Memory();
//
//   String output = "0";
//   String _out = "0";
//   double num1 = 0.0;
//   double num2 = 0.0;
//   String operand = "";
//   buttonPressed(String btnVal){
//     print(btnVal);
//     if(btnVal == "C"){
//       _out = "0";
//       num1 = 0.0;
//       num2 = 0.0;
//       operand = "";
//     }else if(btnVal == "+" || btnVal == "-" || btnVal =="*" || btnVal == "/"){
//       num1 = double.parse(output);
//       operand = btnVal;
//       _out = "0";
//       output = output + btnVal;
//     }else if(btnVal == "."){
//       if(_out.contains(".")){
//         print("Already exist");
//         return;
//       }else{
//         _out = _out + btnVal;
//       }
//     }else if(btnVal == "="){
//       num2 = double.parse(output);
//       if(operand == "+"){
//         _out = (num2 + num1).toString();
//       }
//       if(operand == "-"){
//         _out = (num1 - num2).toString();
//       }
//       if(operand == "*"){
//         _out = (num2 * num1).toString();
//       }
//       if(operand == "/"){
//         _out = (num1 / num2).toString();
//       }
//       num1 = 0.0;
//       num2 = 0.0;
//       //_out = "0";
//     }else{
//       _out = _out+ btnVal;
//     }
//     setState(() {
//       output = double.parse(_out).toStringAsFixed(2);
//     });
//   }
//   Widget buildButton(String ButtonVal){
//     return Expanded(
//         child: Container(
//           padding: EdgeInsets.all(0.0),
//           margin: EdgeInsets.all(10.0),
//           decoration: BoxDecoration(
//             color: Colors.grey[300],
//             borderRadius: BorderRadius.all(Radius.circular(15.0)),
//             boxShadow: const [
//               BoxShadow(
//                   offset: Offset(2.0,2.0),
//                   blurRadius: 8.0,
//                   spreadRadius: 1.0
//               ),
//               BoxShadow(
//                   color: Colors.white,
//                   offset: Offset(-2.0,-2.0),
//                   blurRadius: 8.0,
//                   spreadRadius: 1.0
//               ),
//             ],
//           ),
//           child: MaterialButton(
//             padding: const EdgeInsets.all(30.0),
//             child: Text(ButtonVal, style: TextStyle(
//                 fontSize: 22.0
//             ),),
//             onPressed: ()=>
//                 buttonPressed(ButtonVal)
//             ,
//           ),
//         )
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: Colors.grey[300],
//           body: Container(
//             child: Column(
//               children: <Widget>[
//                 Container(
//                     alignment: Alignment.centerRight,
//                     padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 50.0),
//                     child: Text(output, style: TextStyle(
//                         fontSize: 60.0
//                     ),)
//                 ),
//                 Expanded(
//                   child: Divider(),
//                 ),
//                 Column(
//                   children: <Widget>[
//                     Row(
//                       children: <Widget>[
//                         buildButton("."),
//                         buildButton("C"),
//                         buildButton("<-"),
//                         buildButton("*")
//                       ],
//                     ),
//                     Row(
//                       children: <Widget>[
//                         buildButton("7"),
//                         buildButton("8"),
//                         buildButton("9"),
//                         buildButton("/")
//                       ],
//                     ),
//                     Row(
//                       children: <Widget>[
//                         buildButton("4"),
//                         buildButton("5"),
//                         buildButton("6"),
//                         buildButton("+")
//                       ],
//                     ),
//                     Row(
//                       children: <Widget>[
//                         buildButton("1"),
//                         buildButton("2"),
//                         buildButton("3"),
//                         buildButton("-")
//                       ],
//                     ),
//                     Row(
//                       children: <Widget>[
//                         buildButton("0"),
//                         buildButton("="),
//                       ],
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           )
//       ),
//     );
//   }
// }

//==========================
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:to_do_list/models/memory.dart';
//
//
//
// class Calculator extends StatefulWidget {
//   const Calculator({Key? key}) : super(key: key);
//
//   @override
//   _CalculatorState createState() => _CalculatorState();
// }
//
// class _CalculatorState extends State<Calculator> {
//   final _memory = Memory();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Calculadora'),
//       ),
//       body: Column(
//         children: <Widget>[
//           _buildDisplay(),
//           const Divider(height: 0.1),
//           _buildKeyboard(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDisplay() {
//     return Expanded(
//       flex: 1,
//       child: Container(
//         color: Theme.of(context).scaffoldBackgroundColor,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: AutoSizeText(
//                 _memory.result,
//                 minFontSize: 20.0,
//                 maxFontSize: 80.0,
//                 maxLines: 1,
//                 textAlign: TextAlign.end,
//                 style: TextStyle(
//                   fontWeight: FontWeight.w200,
//                   decoration: TextDecoration.none,
//                   fontSize: 80.0,
//                   color: Theme.of(context).primaryColor,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildKeyboardButton(String label,
//       {int flex = 1, Color textColor = Colors.white, Color backgroundColor = Colors.black}) {
//     return Expanded(
//       flex: flex,
//       child: RaisedButton(
//         color: backgroundColor,
//         textColor: textColor,
//         child: Text(
//           label,
//           style:  const TextStyle(fontSize: 24),
//         ),
//         onPressed: () {
//           setState(() {
//             _memory.applyCommand(label);
//           });
//         },
//       ),
//     );
//   }
//
//   Widget _buildKeyboard() {
//     return Container(
//       color: Colors.black,
//       height: 400.0,
//       child: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 1,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 _buildKeyboardButton('AC', textColor: Colors.red),
//                 _buildKeyboardButton('DEL', textColor: Colors.yellowAccent),
//                 _buildKeyboardButton('%', textColor: Colors.red),
//                 _buildKeyboardButton('/', textColor: Colors.red),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 _buildKeyboardButton('7'),
//                 _buildKeyboardButton('8'),
//                 _buildKeyboardButton('9'),
//                 _buildKeyboardButton('x', textColor: Colors.red),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 _buildKeyboardButton('4'),
//                 _buildKeyboardButton('5'),
//                 _buildKeyboardButton('6'),
//                 _buildKeyboardButton('+', textColor: Colors.red),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 _buildKeyboardButton('1'),
//                 _buildKeyboardButton('2'),
//                 _buildKeyboardButton('3'),
//                 _buildKeyboardButton('-', textColor: Colors.red),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 _buildKeyboardButton('0', flex: 2),
//                 _buildKeyboardButton('.'),
//                 _buildKeyboardButton('=', textColor: Colors.green),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//  onDayPressed: (DateTime date, List<Event> events) {
//         setState(() => _currentDate2 = date);
//         events.forEach((event) => print(event.title));
