import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Widgets/Welcome/welcome_text.dart';
import 'package:todo_app/Widgets/Welcome/welcome_tf.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/translations/locale_keys.g.dart';

import 'main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // ignore: prefer_typing_uninitialized_variables
  late var userName;

  @override
  void initState() {
    super.initState();
    Provider.of<TodosProvider>(context, listen: false).initSharedPreferences();
    userName = TodosProvider().readName('userName');
  }

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var surnameController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                const welcomeText(),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 10),
                    child: Column(children: [
                      WelcomCustomTF(
                          controller: nameController,
                          labelText: LocaleKeys.welcomescreen_name_tf.tr()),
                      WelcomCustomTF(
                          controller: surnameController,
                          labelText: LocaleKeys.welcomescreen_surname_tf.tr()),
                    ]),
                  ),
                ),
                Consumer<TodosProvider>(
                  builder: (context, state, child) => Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 13,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.amber.shade600),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            )),
                          ),
                          onPressed: () {
                            bool validResult = formKey.currentState!.validate();
                            if (validResult == true) {
                              state.setName(nameController.text);
                              state.setsurName(surnameController.text);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainScreen()));
                            }
                          },
                          child:
                              Text(LocaleKeys.welcomescreen_done_button.tr())),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
