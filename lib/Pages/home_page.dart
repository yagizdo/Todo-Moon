import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Widgets/Grettings/greetings.dart';
import 'package:todo_app/Widgets/Info/info_widget.dart';
import 'package:todo_app/Widgets/Tasks/task_info.dart';
import 'package:todo_app/Widgets/Todo/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f9f6e8'),
      appBar: homePageAP(),
      body: Column(
        children: const [Greetings(), InfoWidget(), TaskInfo(), TodoWidget()],
      ),
    );
  }
}

AppBar homePageAP() {
  return AppBar(
    leading: const Padding(
        padding: EdgeInsets.only(left: 10.0, top: 15.0),
        child: Icon(Icons.settings, color: Colors.black)),
    //Icon(Icons.settings),
    backgroundColor: HexColor('#f9f6e8'),
    elevation: 0,
  );
}
