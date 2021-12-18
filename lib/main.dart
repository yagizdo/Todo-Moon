import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/Pages/calendar_page.dart';
import 'package:todo_app/Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ToDo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Variables
  String userName = 'John';

  var pageList = [const HomePage(),const CalendarPage()];

  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f3f0e5'),
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 10.0, top: 15.0),
          child: Icon(Icons.settings, color: Colors.black)
        ),
        //Icon(Icons.settings),
        backgroundColor: HexColor('#f7f6f1'),
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.home,
              color: HexColor('#000000'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.th,
              color: HexColor('#000000'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.plus,
              color: HexColor('#000000'),
            ),
            label: '',
          ),BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.calendar ,
              color: HexColor('#000000'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.user,
              color: HexColor('#000000'),
            ),
            label: '2',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: selectedPage,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
      body: pageList[selectedPage],
    );
  }
}
