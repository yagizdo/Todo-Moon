import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Pages/welcome_screen.dart';
import 'package:todo_app/provider/todos_provider.dart';

import 'Pages/main_screen.dart';
import 'Pages/splash_screen.dart';

void main() {
  runApp(
      ChangeNotifierProvider<TodosProvider>(
          create: (BuildContext context) => TodosProvider(),
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Todo Moon',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: HexColor('#f9f6e8'),
    ),
    home: Consumer<TodosProvider>(
      builder: (context, state,child) {
        if(state.isLoading == true) {
          print('isLoading 1 : ${state.isLoading}');
          return SplashScreen();

        } else {
          return state.nameIsEmpty() == true ? const WelcomeScreen() :const MainScreen();
        }
      },
      ),
    );
  }
}


