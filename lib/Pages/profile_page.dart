import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Widgets/Profile/complete_todo_list.dart';
import 'package:todo_app/Widgets/Profile/completed_task_info.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAB(),
      body: Center(
        child: Container(
          color: HexColor('#f3f0e5'),
          child: Column(
            children: const [
              CircleAvatar(
                backgroundImage:
                    NetworkImage('https://yagizdokumaci.com/img/yagophoto.jpg'),
                radius: 60,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Yılmaz Yağız Dokumacı',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              CompletedTaskInfo(),
              CompleteTodoList()
            ],
          ),
        ),
      ),
    );
  }
}

AppBar homePageAB() {
  return AppBar(
    leading: const Padding(
        padding: EdgeInsets.only(left: 10.0, top: 15.0),
        child: Icon(Icons.settings, color: Colors.black)),
    //Icon(Icons.settings),
    backgroundColor: HexColor('#f3f0e5'),
    elevation: 0,
  );
}
