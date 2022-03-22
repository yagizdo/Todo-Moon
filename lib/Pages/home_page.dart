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
      body: LayoutBuilder(builder: (context, constraints) {
        print('width : ${constraints.maxWidth}');
        print('height : ${constraints.maxHeight}');
        return Column(
          children: [
            constraints.maxWidth < 350
                ? Greetings(customFontSize: 25)
                : Greetings(
                    customFontSize: 30,
                  ),
            constraints.maxWidth < 350
                ? InfoWidget(
                    height: 7.4,
                    width: 1.1,
                    customFontSize: 13,
                  )
                // For iphone 11 - height 812  || iphone 13 pro - height 760
                : constraints.maxHeight == 812 || constraints.maxHeight == 760
                    ? InfoWidget(height: 11, width: 1.1, customFontSize: 18)
                    // For iphone 11 pro, 13 mini, iphone xs - height 728
                    : constraints.maxHeight == 728
                        ? InfoWidget(
                            height: 10.6, width: 1.1, customFontSize: 18)
                        // For iphone 8,7,iphone se  - height 617
                        : constraints.maxHeight == 617
                            ? InfoWidget(
                                height: 8.5, width: 1.1, customFontSize: 18)
                            // iphone 13 Pro max - 842
                            : constraints.maxHeight == 842
                                ? InfoWidget(
                                    height: 11.2,
                                    width: 1.1,
                                    customFontSize: 18)
                                : constraints.maxHeight == 686
                                    ? InfoWidget(
                                        height: 9.4,
                                        width: 1.1,
                                        customFontSize: 18)
                                    : InfoWidget(
                                        height: 8,
                                        width: 1.1,
                                        customFontSize: 18),
            const TaskInfo(),
            const Expanded(child: TodoWidget())
          ],
        );
      }),
    );
  }
}
