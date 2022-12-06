import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double num1 = 0;
  double num2 = 0;
  String result = '0';
  String operator = "";
  String cal = '0';

  String old = "";

  Widget buttondizayn(String butondegeri) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          side: BorderSide(width: 1.5, color: Colors.indigoAccent),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: () {
          setState(() {
            if (butondegeri == 'C') {
              cal = '0';
              num1 = 0;
              num2 = 0;
              operator = "";
            } else if (butondegeri == '+') {
              num1 = double.parse(result);
              operator = butondegeri;
              cal = '0';
            } else if (butondegeri == '-') {
              num1 = double.parse(result);
              operator = butondegeri;
              cal = '0';
            } else if (butondegeri == '/') {
              num1 = double.parse(result);
              operator = butondegeri;
              cal = '0';
            } else if (butondegeri == '*') {
              num1 = double.parse(result);
              operator = butondegeri;
              cal = '0';
            } else if (butondegeri == "=" && operator == '+') {
              num2 = double.parse(result);

              cal = (num1 + num2).toString();
              old = cal;
            } else if (butondegeri == "=" && operator == '-') {
              num2 = double.parse(result);

              cal = (num1 - num2).toString();
              old = cal;
            } else if (butondegeri == "=" && operator == '/') {
              num2 = double.parse(result);

              cal = (num1 / num2).toString();
              old = cal;
            } else if (butondegeri == "=" && operator == '*') {
              num2 = double.parse(result);

              cal = (num1 * num2).toString();
              old = cal;
            } else if (butondegeri == '<') {
              cal = result.substring(0, result.length - 1);
            } else {
              cal = cal + butondegeri;
            }

            result = double.parse(cal).toStringAsFixed(2);

            if (butondegeri != 'C') {
              if (butondegeri == '=') {
                old = old;
              } else if (butondegeri == '<') {
                old = old.substring(0, old.length - 1);
              } else {
                old = old + butondegeri;
              }
            } else {
              old = '';
            }
          });
        },
        child: Container(
          child: Text(
            butondegeri,
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          padding: EdgeInsets.all(15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFbdc6cf),
      appBar: AppBar(
        toolbarHeight: 60,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Calculator ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Icon(
              Icons.calculate,
              size: 35,
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        old,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15, right: 50, bottom: 15),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      result,
                      style: TextStyle(
                        fontSize: 85,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 2,
              color: Colors.indigoAccent,
              height: 40,
              indent: 30,
              endIndent: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Column(
                    children: [
                      buttondizayn("7"),
                      buttondizayn("4"),
                      buttondizayn("1"),
                      buttondizayn("C"),
                    ],
                  ),
                  Column(
                    children: [
                      buttondizayn("8"),
                      buttondizayn("5"),
                      buttondizayn("2"),
                      buttondizayn("0"),
                    ],
                  ),
                  Column(
                    children: [
                      buttondizayn("9"),
                      buttondizayn("6"),
                      buttondizayn("3"),
                      buttondizayn("<"),
                    ],
                  ),
                  Column(
                    children: [
                      buttondizayn("+"),
                      buttondizayn("-"),
                      buttondizayn("/"),
                      buttondizayn("*"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Container(
                    child: buttondizayn("="),
                    width: 275,
                  ),
                  buttondizayn("."),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
