import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Pages/profile_page.dart';
import 'package:todo_app/provider/todos_provider.dart';

import 'add_todo.dart';
import 'calendar_page.dart';
import 'dashboard_page.dart';
import 'home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //Variables
  int currentTab = 0;
  var pageList = [
    const HomePage(),
    const CalendarPage(),
    const AddTodo(),
    const DashboardPage(),
    const ProfilePage()
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<TodosProvider>(context, listen: false).initSharedPreferences();
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print('width : ${constraints.maxWidth}');
      print('height : ${constraints.maxHeight}');
      return Scaffold(
        backgroundColor: HexColor('#f3f0e5'),
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        floatingActionButton: SizedBox(
          height: 50,
          child: FloatingActionButton(
            backgroundColor: HexColor('#000000'),
            child: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                showCupertinoModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  context: context,
                  builder: (context) => SizedBox(
                      height:
                          // for iphone 11
                          constraints.maxHeight == 896 ||
                                  constraints.maxHeight == 926
                              ? MediaQuery.of(context).size.height / 1.45
                              :
                              // For iphone 11 pro, 12 mini, 12 pro
                              constraints.maxHeight == 812
                                  ? MediaQuery.of(context).size.height / 1.35
                                  :
                                  // for iphone 12
                                  constraints.maxHeight == 844
                                      ? MediaQuery.of(context).size.height / 1.4
                                      :
                                      // for iphone 8 plus
                                      constraints.maxHeight == 736
                                          ? MediaQuery.of(context).size.height /
                                              1.3
                                          :
                                          // for iphone 7
                                          constraints.maxHeight == 667
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.22
                                              :
                                              // for iphone 5S and iPhone SE 1. Gen
                                              constraints.maxHeight == 568
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      1.1
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      1.5,
                      child: const AddTodo()),
                );
                currentTab = 5;
              });
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const HomePage();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.home,
                            color: currentTab == 0 ? Colors.black : Colors.grey,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = const CalendarPage();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.calendar,
                              color:
                                  currentTab == 1 ? Colors.black : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Right Tab Icons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const DashboardPage();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.clipboardCheck,
                            color: currentTab == 3 ? Colors.black : Colors.grey,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = const ProfilePage();
                            currentTab = 4;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.user,
                              color:
                                  currentTab == 4 ? Colors.black : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
