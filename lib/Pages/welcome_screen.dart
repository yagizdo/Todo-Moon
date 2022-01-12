import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
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
    Provider.of<TodosProvider>(context,listen: false).initSharedPreferences();
    Future.delayed(Duration.zero,(){
      //your code goes here
      print('Sonuc : ${Provider.of<TodosProvider>(context,listen: false).nameIsEmpty()} ');
      if(Provider.of<TodosProvider>(context,listen: false).nameIsEmpty() == false) {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()));
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    var nameController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top : 100.0),
        child: Column(
          children: [
            const Text('Please write your name..'),
            Form(
                key:formKey ,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'Name cant be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                )
            ),
            Consumer<TodosProvider>(
              builder: (context,state,child) => ElevatedButton(onPressed: () {
                bool validResult = formKey.currentState!.validate();
                if(validResult == true) {
                  state.setName(nameController.text);
                  print('Name : ${state.name}');
                  print('Name 2 : ${nameController.text}');
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                }
              }, child: Text('Next')),
            )
          ],
        ),
      ),
    );
  }
}