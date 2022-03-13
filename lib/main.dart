import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Pages/main_screen.dart';
import 'package:todo_app/Pages/welcome_screen.dart';
import 'package:todo_app/provider/todos_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TodosProvider().initSharedPreferences();
  var name = await TodosProvider().readName('userName');
  print('name $name');
  runApp(
    ChangeNotifierProvider<TodosProvider>(
      create: (BuildContext context) => TodosProvider(),
      child: MyApp(
        name: name.toString(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.name}) : super(key: key);
  var name;

  @override
  Widget build(BuildContext context) {
    print('name 2 : $name');
    return MaterialApp(
        title: 'Todo Moon',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: HexColor('#f9f6e8'),
        ),
        home: AnimatedSplashScreen(
          splash: Image.asset('lib/img/Todo Moon Logo.png'),
          nextScreen: name.toString().contains('null')
              ? const WelcomeScreen()
              : const MainScreen(),
          duration: 2000,
        ));
  }
}
