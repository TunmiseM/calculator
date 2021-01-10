import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/CalcButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  CalcApp({Key key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _expression = '';
  String _history = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculator',
        home: Scaffold(
          backgroundColor: Colors.green[900],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  _history,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF545f61),
                    ),
                  ),
                ),
                alignment: Alignment(1, 1),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Text(
                  _expression,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                ),
                alignment: Alignment(1, 1),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: 'AC',
                    fillColor: 0xFF6C807F,
                    callback: allClear,
                  ),
                  CalcButton(
                    text: 'C',
                    fillColor: 0xFF6C807F,
                    callback: clear,
                  ),
                  CalcButton(
                    text: '%',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '/',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: evaluate,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '7',
                    textColor: 0xFFfffffF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '8',
                    textColor: 0xFFfffffF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '9',
                    textColor: 0xFFfffffF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '*',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: evaluate,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '4',
                    textColor: 0xFFfffffF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '5',
                    textColor: 0xFFfffffF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '6',
                    textColor: 0xFFfffffF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '-',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: evaluate,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '1',
                    textColor: 0xFFfffffF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '2',
                    textColor: 0xFFfffffF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '3',
                    textColor: 0xFFfffffF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '+',
                    textColor: 0xFFfffffF,
                    callback: evaluate,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '.',
                    textColor: 0xFFfffffF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '0',
                    textColor: 0xFFfffffF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '00',
                    textColor: 0xFFfffffF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '=',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: evaluate,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
