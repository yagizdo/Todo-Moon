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
  var userName = await TodosProvider().readName('userName');
  runApp(
    ChangeNotifierProvider<TodosProvider>(
      create: (BuildContext context) => TodosProvider(),
      child: MyApp(
        userName: userName.toString(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.userName}) : super(key: key);
  final userName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo Moon',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: HexColor('#f9f6e8'),
        ),
        home: AnimatedSplashScreen(
          splash: Image.asset('lib/img/Todo Moon Logo.png'),
          nextScreen: userName.toString().contains('null')
              ? const WelcomeScreen()
              : const MainScreen(),
          duration: 2000,
        ));
  }
}
