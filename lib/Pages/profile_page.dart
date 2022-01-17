import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Pages/settings_page.dart';
import 'package:todo_app/Widgets/Profile/profile_circle.dart';
import 'package:todo_app/Widgets/Profile/name_text.dart';

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
          children: const [
            ProfileImg(),
            NameText(),
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
        padding: const EdgeInsets.only(left: 10.0, top: 15.0),
        child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
              },
              icon: const Icon(Icons.settings, color: Colors.black),
    ),
    ),
  );
}
