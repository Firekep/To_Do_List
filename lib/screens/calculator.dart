import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/models/controller/home_controller.dart';
import '../models/build.button.dart';

class Calculator extends StatelessWidget {
  Calculator({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());
  final Color color = const Color.fromRGBO(198, 45, 91, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() =>  Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(controller.equation.value, style:TextStyle(fontSize: controller.equationFontSize.value),),
          )),

          Obx(() => Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(controller.result.value, style: TextStyle(fontSize: controller.resultFontSize.value),),
          )),

          const Expanded(child: Divider()),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children:  [
                    TableRow(
                        children:[
                          BuildButton(buttonText: "C", buttonHeight: 1, buttonColor: color),
                          BuildButton(buttonText: "⌫", buttonHeight: 1, buttonColor: color),
                          BuildButton(buttonText: "÷", buttonHeight: 1, buttonColor: color),
                        ]
                    ),

                    TableRow(
                        children:[
                          BuildButton(buttonText: "7", buttonHeight: 1, buttonColor: color),
                          BuildButton(buttonText: "8", buttonHeight: 1, buttonColor: color),
                          BuildButton(buttonText: "9", buttonHeight: 1, buttonColor: color),
                        ]
                    ),

                    TableRow(
                        children:[
                          BuildButton(buttonText: "4", buttonHeight: 1, buttonColor: color),
                          BuildButton(buttonText: "5", buttonHeight: 1, buttonColor: color),
                          BuildButton(buttonText: "6", buttonHeight: 1, buttonColor: color),
                        ]
                    ),

                    TableRow(
                        children:[
                          BuildButton(buttonText: "1", buttonHeight: 1, buttonColor: color),
                          BuildButton(buttonText: "2", buttonHeight: 1, buttonColor: color),
                          BuildButton(buttonText: "3", buttonHeight: 1, buttonColor: color),
                        ]
                    ),
                    TableRow(
                        children:[
                          BuildButton(buttonText: ".", buttonHeight: 1, buttonColor: color),
                          BuildButton(buttonText: "0", buttonHeight: 1, buttonColor: color),
                          BuildButton(buttonText: "00", buttonHeight: 1, buttonColor: color),
                        ]
                    ),
                  ],
                ),

              ),

              SizedBox(
                width: MediaQuery.of(context).size.width  * 0.25,
                child: Table(
                  children: [
                    TableRow(
                        children:[ BuildButton(buttonText: '×', buttonHeight: 1, buttonColor: color,)
                        ]),

                    TableRow(
                        children:[ BuildButton(buttonText: '-', buttonHeight: 1, buttonColor: color),
                        ]),

                    TableRow(
                        children:[ BuildButton(buttonText: '+', buttonHeight: 1, buttonColor: color),
                        ]),

                    TableRow(
                        children:[ BuildButton(buttonText: '=', buttonHeight: 2, buttonColor: color),
                        ]),

                  ],
                ),
              )

            ],
          )

        ],
      ),
    );
  }
}
