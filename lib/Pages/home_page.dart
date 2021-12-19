import 'package:flutter/material.dart';
import 'package:todo_app/Widgets/Grettings/greetings.dart';
import 'package:todo_app/Widgets/Info/info_widget.dart';
import 'package:todo_app/Widgets/Tasks/task_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Greetings(),
        InfoWidget(),
        TaskInfo()
      ],
    );
  }
}
