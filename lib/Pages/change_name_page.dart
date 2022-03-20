import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Widgets/Welcome/welcome_tf.dart';
import 'package:todo_app/provider/todos_provider.dart';

import '../Widgets/Profile/change_name_text.dart';

class ChangeNameScreen extends StatefulWidget {
  const ChangeNameScreen({Key? key}) : super(key: key);

  @override
  _ChangeNameScreenState createState() => _ChangeNameScreenState();
}

class _ChangeNameScreenState extends State<ChangeNameScreen> {
  // ignore: prefer_typing_uninitialized_variables
  late final formKey;
  @override
  void initState() {
    super.initState();
    Provider.of<TodosProvider>(context, listen: false).initSharedPreferences();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var surnameController = TextEditingController();
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Center(child: ChangeNameText()),
              Form(
                key: formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
                  child: Column(children: [
                    WelcomCustomTF(
                        controller: nameController, labelText: 'Name'),
                    WelcomCustomTF(
                        controller: surnameController, labelText: 'Surname'),
                  ]),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Consumer<TodosProvider>(
                      builder: (context, state, child) => Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 13,
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.amber.shade600),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0),
                                )),
                              ),
                              onPressed: () {
                                bool validResult =
                                    formKey.currentState!.validate();
                                if (validResult == true) {
                                  state.setName(nameController.text);
                                  state.setsurName(surnameController.text);
                                  Navigator.of(context).pop();
                                }
                              },
                              child: const Text('Done')),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 13,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(color: Colors.amber, width: 3),
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                              color: Colors.amber, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
