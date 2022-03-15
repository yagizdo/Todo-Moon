import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Widgets/HomePage/Grettings/greetings.dart';
import 'package:todo_app/Widgets/HomePage/Info/info_widget.dart';
import 'package:todo_app/Widgets/HomePage/Tasks/task_info.dart';
import 'package:todo_app/Widgets/Todo/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f9f6e8'),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              const Greetings(),
              constraints.maxWidth < 350
                  ? InfoWidget(
                      height: 7.4,
                      width: 1.1,
                      customFontSize: 16,
                    )
                  : InfoWidget(
                      height: 8,
                      width: 1.1,
                      customFontSize: 18,
                    ),
              const TaskInfo(),
              const Expanded(child: TodoWidget())
            ],
          );
        }),
      ),
    );
  }
}
