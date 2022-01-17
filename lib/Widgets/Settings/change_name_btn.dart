import 'package:flutter/material.dart';
import 'package:todo_app/Pages/welcome_screen.dart';

class ChangeNameBTN extends StatelessWidget {
  const ChangeNameBTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top : 10.0 ,left : 10.0),
      child: ElevatedButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
      }, child: const Text('Change Name'),style: ElevatedButton.styleFrom(primary : Colors.black38,shape: const StadiumBorder(),)),
    );
  }
}
