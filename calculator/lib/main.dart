import 'package:calculator/widgets/CalculatorButton.dart';
import 'package:calculator/widgets/CalculatorButtonFunc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  CalculatorApp({super.key});
  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String textToDisplay = '';
  double res = 0;
  String operation = '';
  double firstNumber = 0;
  double secondNumber = 0;

  void onClick(String response) {
    switch (response) {
      case 'C':
        {
          res = 0;
          textToDisplay = '';
          operation = '';
          firstNumber = 0;
          secondNumber = 0;
        }
        break;
      case '=':
        {
          secondNumber = double.parse(textToDisplay);
          (operation == '+') ? res = firstNumber + secondNumber : 0;
          (operation == '-') ? res = firstNumber - secondNumber : 0;
          (operation == '*') ? res = firstNumber * secondNumber : 0;
          (operation == '/') ? res = firstNumber / secondNumber : 0;
          (operation == '^')
              ? res = (pow(firstNumber, secondNumber)).toDouble()
              : 0;
          textToDisplay = res.toString();
        }
        break;
      case '+':
        {
          firstNumber = double.parse(textToDisplay);
          operation = '+';
          textToDisplay = '';
        }
        break;
      case '-':
        {
          firstNumber = double.parse(textToDisplay);
          operation = '-';
          textToDisplay = '';
        }
        break;
      case 'x':
        {
          firstNumber = double.parse(textToDisplay);
          operation = '*';
          textToDisplay = '';
        }
        break;
      case '/':
        {
          firstNumber = double.parse(textToDisplay);
          operation = '/';
          textToDisplay = '';
        }
        break;
      case '^':
        {
          firstNumber = double.parse(textToDisplay);
          operation = '^';
          textToDisplay = '';
        }
        break;
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case '0':
        {
          textToDisplay += response;
        }
        break;
      case '+/-':
        {
          if (operation == '') {
            firstNumber = double.parse(textToDisplay) * -1;
            textToDisplay = '$firstNumber';
          } else {
            secondNumber = double.parse(textToDisplay) * -1;
            textToDisplay = '$secondNumber';
          }
        }
        break;
      case '<=':
        {
          if (operation == '') {
            textToDisplay = '';
            firstNumber = 0;
          } else {
            textToDisplay = '';
            secondNumber = 0;
          }
        }
        break;
      case '.':
        {
          (textToDisplay != '' && !(textToDisplay.contains('.')))
              ? textToDisplay += '.'
              : 0;
        }
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caculator',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 27, 31, 33),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Calculator',
            style: GoogleFonts.rubik(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment(1.0, 1.0),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    textToDisplay,
                    style: GoogleFonts.rubik(
                      color: Color.fromARGB(217, 255, 255, 255),
                      fontSize: 45,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButtonFunc(
                    text: 'C',
                    callback: onClick,
                  ),
                  CalculatorButtonFunc(
                    text: '<=',
                    callback: onClick,
                  ),
                  CalculatorButtonFunc(
                    text: '^',
                    callback: onClick,
                  ),
                  CalculatorButtonFunc(
                    text: '/',
                    callback: onClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '9',
                    callback: onClick,
                  ),
                  CalculatorButton(
                    text: '8',
                    callback: onClick,
                  ),
                  CalculatorButton(
                    text: '7',
                    callback: onClick,
                  ),
                  CalculatorButtonFunc(
                    text: 'x',
                    callback: onClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '6',
                    callback: onClick,
                  ),
                  CalculatorButton(
                    text: '5',
                    callback: onClick,
                  ),
                  CalculatorButton(
                    text: '4',
                    callback: onClick,
                  ),
                  CalculatorButtonFunc(
                    text: '-',
                    callback: onClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '3',
                    callback: onClick,
                  ),
                  CalculatorButton(
                    text: '2',
                    callback: onClick,
                  ),
                  CalculatorButton(
                    text: '1',
                    callback: onClick,
                  ),
                  CalculatorButtonFunc(
                    text: '+',
                    callback: onClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '+/-',
                    callback: onClick,
                  ),
                  CalculatorButton(
                    text: '0',
                    callback: onClick,
                  ),
                  CalculatorButton(
                    text: '.',
                    callback: onClick,
                  ),
                  CalculatorButtonFunc(
                    text: '=',
                    callback: onClick,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
