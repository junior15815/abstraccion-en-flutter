import 'package:flutter/material.dart';

import 'package:junior03/comp/CustomAppBar.dart';
import 'package:junior03/comp/CustomAppBarX.dart';
import 'package:junior03/theme/AppTheme.dart';
import './comp/CalcButton.dart';
import 'dart:math';
void main() => runApp(CalcApp());
class CalcApp extends StatefulWidget {
  const CalcApp({super.key}) ;
  @override
  CalcAppState createState() => CalcAppState();
}
class CalcAppState extends State<CalcApp> {
  String valorAnt = '';
  String operador = '';
  TextEditingController _controller = new TextEditingController();
  void numClick(String text) {
    setState(() => _controller.text += text);
    print(_controller);
  }
  void clear(String text) {
    setState(() {
      _controller.text = '';
    });
  }
  void opeClick(String text) {
    setState(() {
      valorAnt = _controller.text;
      operador = text;
      _controller.text = '';
    });
  }
  void accion(){
    setState(() {
      print("");
    });
  }

  void resultOperacion(String text) {
    setState(() {
      switch (operador) {
        case "/":
          _controller.text =
              (int.parse(valorAnt) / int.parse(_controller.text)).toString();
          break;
        case "*":
          _controller.text =
              (int.parse(valorAnt) * int.parse(_controller.text)).toString();
          break;
        case "+":
          _controller.text =
              (int.parse(valorAnt) + int.parse(_controller.text)).toString();
          break;
        case "-":
          _controller.text =
              (int.parse(valorAnt) - int.parse(_controller.text)).toString();
          break;
        case "%":
          _controller.text =
              (int.parse(valorAnt) % int.parse(_controller.text)).toString();
          break;
        case "√": // Handle square root
          _controller.text = sqrt(double.parse(valorAnt)).toStringAsFixed(2);
          break;
        case "π": // Handle Pi (π)
          _controller.text = (3.14159265359).toString();
          break;
        case "x²": // Handle power of 2
          _controller.text = (pow(int.parse(valorAnt), 2)).toString();
          break;
        case "xⁿ": // Handle power to any number
          final base = double.tryParse(valorAnt);
          final exponent = double.tryParse(_controller.text);
          if (base != null && exponent != null) {
            _controller.text = pow(base, exponent).toStringAsFixed(2);
          }
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    List<List> labelList = [["AC","C","%","/"], ["7","8","9","*"],["4","5","6","-"],["1","2","3","+"],[".","0","00","="],["√","π","x²","xⁿ"]];
    List<List> funx=[[clear,clear, opeClick,opeClick,opeClick ],
      [numClick,numClick, numClick,opeClick ],
      [numClick,numClick, numClick,opeClick ],
      [numClick,numClick, numClick,opeClick ],
      [numClick,numClick, numClick,resultOperacion ],
      [opeClick, opeClick, opeClick, opeClick]];

    AppTheme.colorX=Colors.blue;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: AppTheme.themeDataLight,
      darkTheme: AppTheme.themeDataDark,
      home: Scaffold(
        appBar: CustomAppBarX(accionx: accion as Function),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                color:
                Theme.of(context).colorScheme.surfaceVariant,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  textAlign: TextAlign.end,
                  controller: _controller,
                ),
              ),
              SizedBox(height: 20),
              ...List.generate(labelList.length, (index) =>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...List.generate(
                        labelList[index].length,
                            (indexx) => CalcButton(
                          text: labelList[index][indexx],
                          callback: funx[index][indexx] as Function,
                        ),
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}