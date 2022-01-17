import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Widgets/Welcome/welcome_text.dart';
import 'package:todo_app/Widgets/Welcome/welcome_tf.dart';
import 'package:todo_app/provider/todos_provider.dart';

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
    Provider.of<TodosProvider>(context, listen: false).initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var surnameController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: HexColor('#f9f6e8'),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const welcomeText(),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    WelcomCustomTF(controller: nameController, labelText: 'name'),
                    WelcomCustomTF(
                        controller: surnameController, labelText: 'Surname'),
                  ]),
                ),
              ),
              Consumer<TodosProvider>(
                builder: (context, state, child) => ElevatedButton(
                    onPressed: () {
                      bool validResult = formKey.currentState!.validate();
                      if (validResult == true) {
                        state.setName(nameController.text);
                        state.setsurName(surnameController.text);
                        /*
                        print('Name : ${state.name}');
                        print('Surname : ${state.surname}');
                        print('Name 2 : ${nameController.text}');
                        print('Surname 2 : ${surnameController.text}');
                        */
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()));
                      }
                    },
                    child: const Text('Set Name')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
