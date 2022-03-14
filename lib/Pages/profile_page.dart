import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Widgets/Profile/name_text.dart';
import 'package:todo_app/Widgets/Profile/profile_circle.dart';

import '../Widgets/Profile/settings_section.dart';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: const [
              ProfileImg(),
              NameText(),
              SizedBox(
                height: 10,
              ),
              SettingsSection()
            ],
          ),
        ),
      ),
    );
  }
}
