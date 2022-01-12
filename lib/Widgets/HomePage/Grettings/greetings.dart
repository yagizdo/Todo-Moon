import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget _welcomeText(String text, double size, FontWeight fontWeight,
    Color color, double minFont) {
  return AutoSizeText(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    ),
    minFontSize: minFont,
  );
}

class Greetings extends StatelessWidget {
  const Greetings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 15,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 7.5,
          color: HexColor('#f9f6e8'),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _welcomeText('Hello', 40, FontWeight.normal, Colors.black, 15),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: _welcomeText(
                      'John', 40, FontWeight.bold, Colors.black, 15),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: _welcomeText(
                        'How is your work life balance this week?',
                        15.5,
                        FontWeight.normal,
                        Colors.black,
                        15)),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
