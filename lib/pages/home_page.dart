import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:login_register/pages/Resgister_page.dart';
import 'package:login_register/pages/smspage.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'fist_page.dart';



class CalculadoraPage extends StatefulWidget {
  @override
  State<CalculadoraPage> createState() => _CalculatorState();
}

class _CalculatorState extends State<CalculadoraPage> {
  String statement = "";
  String result = "0";
  final List<String> buttons = [
    'C',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    'AC',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const SmsPage(),
                        type: PageTransitionType.rightToLeftWithFade));
              },
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 50.0*1,
          systemOverlayStyle: SystemUiOverlayStyle.dark), //AppBar
      
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Flexible(flex: 2, child: resultWidget()),
          Expanded(flex: 4, child: _buttons()),
        ],
      ),
    );
  }

  Widget resultWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(20)*1,
          alignment: Alignment.centerRight,
          child: Text(
            statement,
            style: const TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.centerRight,
          child: Text(
            result,
            style: const TextStyle(
                fontSize: 48 , fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _buttons() {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, int index) {
        return _myButton(buttons[index]);
      },
      itemCount: buttons.length,
    );
  }

  _myButton(String text) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            handleButtonTap(text);
          });
        },
        color: _getColor(text),
        textColor: const Color.fromARGB(255, 0, 0, 0),
        child: Text(
          text,
          style: const TextStyle(fontSize: 24),
        ),
        shape: const CircleBorder(),
      ),
    );
  }

  handleButtonTap(String text) {
    if (text == "AC") {
      statement = "";
      result = "0";
      return;
    }
    if (text == "=") {
      result = calculate();
      if (result.endsWith(".0")) {
        result = result.replaceAll(".0", "") ;
      }
      return;
    }

    if (text == "C") {
      statement = statement.substring(0, statement.length - 1);
      return;
    }
    statement = statement + text;
  }

  calculate() {
    try {
      var exp = Parser().parse(statement);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Err";
    }
  }

  _getColor(String text) {
    if (text == "/" || text == "*" || text == "+" || text == "-") {
      return Color.fromARGB(255, 214, 214, 214);
    }
    if (text == "C" || text == "AC") {
      return Color.fromARGB(255, 214, 214, 214);
    }
    if (text == "(" || text == ")") {
      return Color.fromARGB(255, 214, 214, 214);
    }
    return const Color.fromARGB(255, 214, 214, 214);
  }
}
