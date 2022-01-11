import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget _welcomeText(BuildContext context, String text, double size, FontWeight fontWeight,
    Color color, double minFont) {
  return AutoSizeText(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: Theme.of(context).primaryColor,
    ),
    minFontSize: minFont,
  );
}

class Greetings extends StatelessWidget {
  const Greetings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6.5,
      color: Theme.of(context).backgroundColor,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _welcomeText(context, 'Hello', 40, FontWeight.normal, Colors.black, 15),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child:
                  _welcomeText(context, 'John', 40, FontWeight.bold, Colors.black, 15),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: _welcomeText(context, 'How is your work life balance this week?',
                    15.5, FontWeight.normal, Colors.black, 15)),
          ],
        ),
      ]),
    );
  }
}
