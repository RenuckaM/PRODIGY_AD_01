import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String input = '';
  String result = '0';
  String operation = '';
  double firstNum = 0;
  double secondNum = 0;

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        input = '';
        result = '0';
        firstNum = 0;
        secondNum = 0;
        operation = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == 'x' ||
          buttonText == '/') {
        firstNum = double.parse(input);
        operation = buttonText;
        input = '';
      } else if (buttonText == '=') {
        secondNum = double.parse(input);
        switch (operation) {
          case '+':
            result = (firstNum + secondNum).toString();
            break;
          case '-':
            result = (firstNum - secondNum).toString();
            break;
          case 'x':
            result = (firstNum * secondNum).toString();
            break;
          case '/':
            result = (firstNum / secondNum).toString();
            break;
        }
        input = '';
        operation = '';
      } else {
        input += buttonText;
        result = input;
      }
    });
  }

  Widget buildButton(String buttonText,
      {Color color = Colors.white, Color textColor = Colors.black}) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1, // Keeps buttons square
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => buttonPressed(buttonText),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25), // Rounded corners
              ),
              elevation: 5, // Adds shadow for better look
            ),
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Simple Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 201, 24, 74),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 255, 143, 163),
              Color.fromARGB(255, 255, 204, 213),
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(24),
                alignment: Alignment.bottomRight,
                child: Text(
                  result,
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    buildButton('7', color: Colors.white),
                    buildButton('8', color: Colors.white),
                    buildButton('9', color: Colors.white),
                    buildButton('/',
                        color: Color.fromARGB(255, 201, 24, 74),
                        textColor: Colors.white),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('4', color: Colors.white),
                    buildButton('5', color: Colors.white),
                    buildButton('6', color: Colors.white),
                    buildButton('x',
                        color: Color.fromARGB(255, 201, 24, 74),
                        textColor: Colors.white),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('1', color: Colors.white),
                    buildButton('2', color: Colors.white),
                    buildButton('3', color: Colors.white),
                    buildButton('-',
                        color: Color.fromARGB(255, 201, 24, 74),
                        textColor: Colors.white),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('C',
                        color: Color.fromARGB(255, 201, 24, 74),
                        textColor: Colors.white),
                    buildButton('0', color: Colors.white),
                    buildButton('=',
                        color: Color.fromARGB(255, 201, 24, 74),
                        textColor: Colors.white),
                    buildButton('+',
                        color: Color.fromARGB(255, 201, 24, 74),
                        textColor: Colors.white),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
