import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/name_provider.dart';

import 'main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    if(Provider.of<NameProvider>(context,listen: false).nameIsEmpty() == false) {
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()));
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: welcomeScreenAB(),
      body: Column(
        children: [
          const Text('Please write your name..'),
          Form(
              key:formKey ,
              child: TextFormField(
                controller: nameController,
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'Name cant be empty';
                  }
                  return null;
                },
              )
          ),
          ElevatedButton(onPressed: () {
            bool validResult = formKey.currentState!.validate();
            if(validResult == true) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
            }
          }, child: Text('Next'))
        ],
      ),
    );
  }
}

AppBar welcomeScreenAB() {
  return AppBar(
    leading: const Padding(
        padding: EdgeInsets.only(left: 10.0, top: 15.0),
        child: Icon(Icons.settings, color: Colors.black)),
    //Icon(Icons.settings),
    backgroundColor: HexColor('#f9f6e8'),
    elevation: 0,
  );
}