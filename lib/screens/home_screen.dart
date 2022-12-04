import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double num1 = 0;
  double num2 = 0;
  String operand = '';
  String result = '';
  String text = '';

  Widget buildButton(String btnVal, int value) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        // height: 60,
        //width: 60,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            6,
          ),
          color: Color(value), //grey
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF9E9E9E),
              offset: Offset(2, 2),
              blurRadius: 8,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Color(0xFFFFFFFF),
              offset: Offset(-2, -2),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: MaterialButton(
          onPressed: () {
            buttonClicked(btnVal);
          },
          padding: const EdgeInsets.all(24),
          child: Text(
            btnVal,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        // child: Text(
        //   btnVal,
        //   style: const TextStyle(
        //     fontSize: 23,
        //   ),
        // ),
      ),
    );
  }

  void buttonClicked(String btnVal) {
    if (btnVal == 'C') {
      num1 = 0;
      num2 = 0;
      operand = '';
      result = '';
      text = '';
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == '*' ||
        btnVal == '/') {
      num1 = double.parse(text);
      operand = btnVal;
      result = '';
    } else if (btnVal == '<-') {
      result = result.substring(0, result.length - 1);
    } else if (btnVal == '.') {
      if (result.contains('.')) {
        return;
      } else {
        result = result + btnVal;
      }
    } else if (btnVal == '=') {
      num2 = double.parse(text);

      if (operand == '+') {
        result = (num1 + num2).toString();
      } else if (operand == '-') {
        result = (num1 - num2).toString();
      } else if (operand == '*') {
        result = (num1 * num2).toString();
      } else if (operand == '/') {
        result = (num1 / num2).toString();
      }
    } else {
      result = text + btnVal;
    }

    setState(
      () {
        text = result;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height / 3,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              const Divider(),
              Column(
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton('.',
                          0xFFE1BEE7), //0xFFE0E0E0 grey 300 , // 0xFFE1BEE7 purple 100
                      buildButton('C', 0xFFE1BEE7),
                      buildButton('<-', 0xFFE1BEE7),
                      buildButton('*', 0xFFE1BEE7),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton('7', 0xFFE0E0E0),
                      buildButton('8', 0xFFE0E0E0),
                      buildButton('9', 0xFFE0E0E0),
                      buildButton('/', 0xFFE1BEE7),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton('4', 0xFFE0E0E0),
                      buildButton('5', 0xFFE0E0E0),
                      buildButton('6', 0xFFE0E0E0),
                      buildButton('+', 0xFFE1BEE7),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton('1', 0xFFE0E0E0),
                      buildButton('2', 0xFFE0E0E0),
                      buildButton('3', 0xFFE0E0E0),
                      buildButton('-', 0xFFE1BEE7),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton('0', 0xFFE0E0E0),
                      buildButton('=', 0xFFE1BEE7),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
