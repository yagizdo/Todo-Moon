import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Widgets/Settings/change_name_btn.dart';
import 'package:todo_app/Widgets/Settings/change_name_text.dart';
import 'package:todo_app/Widgets/Settings/clear_todos_btn.dart';
import 'package:todo_app/Widgets/Settings/delete_todo_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsPageAB(context),
      backgroundColor: HexColor('#f9f6e8'),
      body: Center(
        child: Column(
          children: const [
            DeleteTodoTitle(),
            ClearTodosBtn(),
            ChangeNameText(),
            ChangeNameBTN(),
          ],
        ),
      )
    );
  }
}
AppBar settingsPageAB(BuildContext context) {
  return AppBar(
    backgroundColor: HexColor('#f9f6e8'),
    elevation: 0,
    centerTitle: true,
    leading: IconButton(
        icon : const Icon(Icons.arrow_back_ios),
        onPressed: () { Navigator.pop(context);},
        color: Colors.black),
    //Icon(Icons.settings),
    title: const Text('Settings',style: TextStyle(fontSize: 30,color: Colors.black),
    ),
  );
}