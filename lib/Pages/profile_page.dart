import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Widgets/Profile/change_name_btn.dart';
import 'package:todo_app/Widgets/Profile/change_name_text.dart';
import 'package:todo_app/Widgets/Profile/clear_todos_btn.dart';
import 'package:todo_app/Widgets/Profile/delete_todo_text.dart';
import 'package:todo_app/Widgets/Profile/name_text.dart';
import 'package:todo_app/provider/todos_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f9f6e8'),
      appBar: profilePageAB(),
      body: Center(
        child: Column(
          children: [
            Consumer<TodosProvider>(
              builder: (context, state, child) => const CircleAvatar(
                child: Text(
                  'YYD',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                backgroundColor: Colors.orange,
                radius: 50,
              ),
            ),
            const NameText(),
            const DeleteTodoTitle(),
            const ClearTodosBtn(),
            const ChangeNameText(),
            const ChangeNameBTN(),
          ],
        ),
      ),
    );
  }
}

AppBar profilePageAB() {
  return AppBar(
    leading: const Padding(
        padding: EdgeInsets.only(left: 10.0, top: 15.0),
        child: Icon(Icons.settings, color: Colors.black)),
    //Icon(Icons.settings),
    backgroundColor: HexColor('#f9f6e8'),
    elevation: 0,
  );
}
