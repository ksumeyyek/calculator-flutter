import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int num1 = 0;
  int num2 = 0;
  String sonuc = '0';
  String isaret = "";
  String toplam = '0';
  String eski = "";

  Widget buttondizayn(String butondegeri) {
    return Container(
      margin: EdgeInsets.all(6),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
        ),
        onPressed: () {
          setState(() {
            if (butondegeri == 'C') {
              toplam = '0';
              num1 = 0;
              num2 = 0;
              isaret = "";
            } else if (butondegeri == '+') {
              num1 = int.parse(sonuc);
              isaret = butondegeri;
              toplam = '0';
            } else if (butondegeri == "=" && isaret == '+') {
              num2 = int.parse(sonuc);

              toplam = (num1 + num2).toString();


            } else {
              toplam = toplam + butondegeri;
            }

            sonuc = int.parse(toplam).toStringAsFixed(0);

            if (butondegeri != 'C') {
              eski = eski + butondegeri;
            } else {
              eski = '';
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
        title: Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  eski,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 50, bottom: 15),
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                sonuc,
                style: TextStyle(
                  fontSize: 85,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    buttondizayn("7"),
                    buttondizayn("8"),
                    buttondizayn("9"),
                  ],
                ),
                Row(
                  children: [
                    buttondizayn("4"),
                    buttondizayn("5"),
                    buttondizayn("6"),
                  ],
                ),
                Row(
                  children: [
                    buttondizayn("1"),
                    buttondizayn("2"),
                    buttondizayn("3"),
                  ],
                ),
                Row(
                  children: [
                    buttondizayn("C"),
                    buttondizayn("0"),
                    buttondizayn("+"),
                  ],
                ),
                Row(
                  children: [
                    buttondizayn("="),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
