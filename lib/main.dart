import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Pages/main_screen.dart';
import 'package:todo_app/Pages/welcome_screen.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/translations/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  TodosProvider().initSharedPreferences();
  var userName = await TodosProvider().readName('userName');
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    ChangeNotifierProvider<TodosProvider>(
      create: (BuildContext context) => TodosProvider(),
      child: EasyLocalization(
        path: 'lib/langs',
        supportedLocales: [
          Locale('en'),
          Locale('tr'),
        ],
        assetLoader: CodegenLoader(),
        fallbackLocale: Locale('en'),
        child: MyApp(
          userName: userName.toString(),
        ),
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
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      theme: ThemeData(
        primaryColor: HexColor('#f9f6e8'),
      ),
      localizationsDelegates: context.localizationDelegates,
      home: userName.toString().contains('null')
          ? const WelcomeScreen()
          : const MainScreen(),
    );
  }
}
