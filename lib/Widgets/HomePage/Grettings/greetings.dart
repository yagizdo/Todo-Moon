import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

// Welcome Text Widget
Widget _welcomeText(
    String text, double size, FontWeight fontWeight, Color color) {
  return AutoSizeText(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    ),
    maxLines: 1,
  );
}

// ignore: must_be_immutable
class Greetings extends StatelessWidget {
  Greetings({Key? key, required this.customFontSize}) : super(key: key);
  double customFontSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 18,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 7.5,
          color: HexColor('#f9f6e8'),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _welcomeText(
                    'Hello', customFontSize, FontWeight.normal, Colors.black),
                Consumer<TodosProvider>(
                  builder: (context, state, child) => Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: _welcomeText(state.name, customFontSize,
                        FontWeight.bold, Colors.black),
                  ),
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
                    15,
                    FontWeight.normal,
                    Colors.black,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
