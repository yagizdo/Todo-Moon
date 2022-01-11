import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Widgets/Grettings/greetings.dart';
import 'package:todo_app/Widgets/Info/info_widget.dart';
import 'package:todo_app/Widgets/Tasks/task_info.dart';
import 'package:todo_app/Widgets/Todo/todo_list.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/utils/theme_notifier.dart';
import 'package:todo_app/values/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _darkTheme = false;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                child: _darkTheme ? const Icon(Icons.wb_sunny, color: Colors.white) : const Icon(Icons.nightlight_round, color: Colors.black),
                onTap: () {
                  setState(() {
                    _darkTheme = !_darkTheme;
                  });
                  onThemeChanged(_darkTheme, themeNotifier);
                },
              )),
        ],
        leading: const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 15.0),
            child: Icon(Icons.settings, color: Colors.black)),
        //Icon(Icons.settings),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: const [Greetings(), InfoWidget(), TaskInfo(), TodoWidget()],
      ),
    );
  }
}

void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
  (value)
      ? themeNotifier.setTheme(darkTheme)
      : themeNotifier.setTheme(lightTheme);
  var prefs = await SharedPreferences.getInstance();
  prefs.setBool('darkMode', value);
}
