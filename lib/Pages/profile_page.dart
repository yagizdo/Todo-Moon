import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Pages/settings_page.dart';
import 'package:todo_app/Widgets/Settings/change_name_btn.dart';
import 'package:todo_app/Widgets/Settings/change_name_text.dart';
import 'package:todo_app/Widgets/Settings/clear_todos_btn.dart';
import 'package:todo_app/Widgets/Settings/delete_todo_text.dart';
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
      appBar: profilePageAB(context),
      body: Center(
        child: Column(
          children: [
            Consumer<TodosProvider>(
              builder: (context, state, child) => CircleAvatar(
                child: Text(
                  'YY',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                backgroundColor: HexColor('#ff9d73'),
                radius: 50,
              ),
            ),
            const NameText(),
          ],
        ),
      ),
    );
  }
}

AppBar profilePageAB(BuildContext context) {
  return AppBar(
    backgroundColor: HexColor('#f9f6e8'),
    elevation: 0,
    leading:  Padding(
        padding: EdgeInsets.only(left: 10.0, top: 15.0),
        child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              icon: Icon(Icons.settings, color: Colors.black),
    ),
    ),
  );
}
