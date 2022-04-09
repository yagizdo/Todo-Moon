import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Widgets/Dashboard/complete_todo_list.dart';
import 'package:todo_app/Widgets/Dashboard/completed_task_info.dart';
import 'package:todo_app/translations/locale_keys.g.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardAB(),
      body: Container(
        color: HexColor('#f9f6e8'),
        child: Column(
          children: const [CompletedTaskInfo(), CompleteTodoList()],
        ),
      ),
    );
  }
}

AppBar dashboardAB() {
  return AppBar(
    centerTitle: true,
    backgroundColor: HexColor('#f9f6e8'),
    elevation: 0,
    title: Text(
      LocaleKeys.dashboard_title.tr(),
      style: TextStyle(fontSize: 25, color: Colors.black),
    ),
  );
}
