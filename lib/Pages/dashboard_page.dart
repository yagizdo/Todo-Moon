import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Widgets/Dashboard/complete_todo_list.dart';
import 'package:todo_app/Widgets/Dashboard/completed_task_info.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardAP(),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: const [
            CompletedTaskInfo(),
            CompleteTodoList()
          ],
        ),
      ),
    );
  }
}

AppBar DashboardAP() {
  return AppBar(
    leading: const Padding(
        padding: EdgeInsets.only(left: 10.0, top: 15.0),
        child: Icon(Icons.settings, color: Colors.black)),
    //Icon(Icons.settings),
    elevation: 0,
  );
}