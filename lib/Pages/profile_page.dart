import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Pages/dashboard_page.dart';
import 'package:todo_app/Widgets/Profile/clear_todos_btn.dart';

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
          children: const [
            CircleAvatar(
              child: Text('YD',style: TextStyle(fontSize: 30,color: Colors.white),),
              backgroundColor: Colors.black,
              radius: 50,
            ),
            ClearTodosBtn(),
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