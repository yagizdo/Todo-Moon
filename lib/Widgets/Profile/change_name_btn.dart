import 'package:flutter/material.dart';
import 'package:todo_app/Pages/welcome_screen.dart';

class ChangeNameBTN extends StatelessWidget {
  const ChangeNameBTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top : 10.0 ,left : 10.0),
      child: ElevatedButton(onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
      }, child: Text('Change Name'),style: ElevatedButton.styleFrom(primary : Colors.black38,shape: const StadiumBorder(),)),
    );
  }
}
