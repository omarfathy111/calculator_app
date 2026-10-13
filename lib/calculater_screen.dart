import 'package:flutter/material.dart';
import 'package:flutter_task1/calulator_button.dart';
import 'package:flutter_task1/colors/colors_claculator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String resText = '';
  String lhs = '';
  String operator = '';

  @override
  Widget build(Object context) {
    return Scaffold(
      backgroundColor: ColorsClaculator.blackColor,
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
         

            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  '$lhs $operator $resText ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: ColorsClaculator.whiteColor,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  spacing: 18,
                  children: [
                    Expanded(
                      flex: 3,

                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              spacing: 13,
                              children: [
                                CalulatorButton(
                                  onButtonClick: onClearClick,

                                  text: 'Ac',
                                  backgroundColor:
                                      ColorsClaculator.lightGreyColor,

                                  textColor: ColorsClaculator.whiteColor,
                                ),
                                CalulatorButton(
                                  onButtonClick: onBackSpaceClick,

                                  text: '>',
                                  isIcon: true,
                                  backgroundColor:
                                      ColorsClaculator.lightGreyColor,
                                  textColor: ColorsClaculator.whiteColor,
                                  child: Icon(
                                    Icons.backspace_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                CalulatorButton(
                                  onButtonClick: onOperatorClicked,

                                  text: '/',
                                  backgroundColor:
                                      ColorsClaculator.lightGreyColor,
                                  textColor: ColorsClaculator.whiteColor,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              spacing: 13,

                              children: [
                                CalulatorButton(
                                  text: '7',
                                  onButtonClick: onDigitalClick,
                                ),
                                CalulatorButton(
                                  text: '8',
                                  onButtonClick: onDigitalClick,
                                ),
                                CalulatorButton(
                                  text: '9',
                                  onButtonClick: onDigitalClick,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              spacing: 13,

                              children: [
                                CalulatorButton(
                                  text: '4',
                                  onButtonClick: onDigitalClick,
                                ),
                                CalulatorButton(
                                  text: '5',
                                  onButtonClick: onDigitalClick,
                                ),
                                CalulatorButton(
                                  text: '6',
                                  onButtonClick: onDigitalClick,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              spacing: 13,

                              children: [
                                CalulatorButton(
                                  text: '1',
                                  onButtonClick: onDigitalClick,
                                ),
                                CalulatorButton(
                                  text: '2',
                                  onButtonClick: onDigitalClick,
                                ),
                                CalulatorButton(
                                  text: '3',
                                  onButtonClick: onDigitalClick,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              spacing: 13,

                              children: [
                                CalulatorButton(
                                  text: '0',
                                  flex: 2,
                                  onButtonClick: onDigitalClick,
                                ),
                                CalulatorButton(
                                  text: '.',
                                  onButtonClick: onDigitalClick,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CalulatorButton(
                            onButtonClick: onOperatorClicked,

                            flex: 2,
                            text: '*',
                            backgroundColor: ColorsClaculator.darkBlueColor,
                            textColor: ColorsClaculator.whiteColor,
                          ),
                          CalulatorButton(
                            onButtonClick: onOperatorClicked,

                            flex: 2,
                            text: '-',
                            backgroundColor: ColorsClaculator.darkBlueColor,
                            textColor: ColorsClaculator.whiteColor,
                          ),
                          CalulatorButton(
                            onButtonClick: onOperatorClicked,

                            flex: 2,
                            text: '%',
                            backgroundColor: ColorsClaculator.darkBlueColor,
                            textColor: ColorsClaculator.whiteColor,
                          ),
                          CalulatorButton(
                            onButtonClick: onOperatorClicked,

                            flex: 3,
                            text: '+',
                            backgroundColor: ColorsClaculator.darkBlueColor,
                            textColor: ColorsClaculator.whiteColor,
                          ),

                          CalulatorButton(
                            onButtonClick: onEqualClick,
                            flex: 3,
                            text: '=',
                            backgroundColor: ColorsClaculator.lightBlueColor,
                            textColor: ColorsClaculator.whiteColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDigitalClick(String text) {
    resText += text;
    setState(() {});
  }

  void onOperatorClicked(String ckickedOperator) {
    if (operator.isEmpty) {
      lhs = resText;
    } else {
      String rhs = resText;
      lhs = calculate(lhs, operator, rhs);
    }
    operator = ckickedOperator;
    resText = '';

    setState(() {});
  }

  void onEqualClick(String text) {
    String rhs = resText;
    resText = calculate(lhs, operator, rhs);
    lhs = '';
    operator = '';
    setState(() {});
  }

  void onClearClick(String text) {
    resText = '';
    lhs = '';
    operator = '';
    setState(() {});
  }

  void onBackSpaceClick(String text) {
    if (resText.isEmpty) {
      return;
    }
    resText = resText.substring(0, resText.length - 1);
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    double res = 0.0;

    if (operator == '+') {
      res = num1 + num2;
    } else if (operator == '-') {
      res = num1 - num2;
    } else if (operator == '*') {
      res = num1 * num2;
    } else if (operator == '/') {
      res = num1 / num2;
    } else if (operator == '%') {
      res = num1 % num2;
    }
    return res.toString();
  }
}
