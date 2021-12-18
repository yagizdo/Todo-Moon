import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Widgets/info_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  const [
            AutoSizeText(
              'Hello',
              style: TextStyle(fontSize: 40),
              minFontSize: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left : 10.0),
              child: AutoSizeText(
                'John!',
                style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
                minFontSize: 15,
              ),
            ),            ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(top : 13.0),
              child: Text(
                'How is your work life balance this week?', style: TextStyle(fontSize: 15.5),
              ),
            ),
          ],
        ),
        Row(children: [InfoWidget()],)
      ],
    );
  }
}
