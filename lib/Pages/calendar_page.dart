import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f9f6e8'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top : 100.0),
          child: Column(
            children: [
              Image.asset('lib/img/Todo Moon Logo.png',width: 150,height: 150,),
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text('Calendar Page',style: TextStyle(fontSize: 30),),
              ),
              const Text('In Progress..',style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
/*
AppBar homePageAB() {
  return AppBar(
    leading: const Padding(
        padding: EdgeInsets.only(left: 10.0, top: 15.0),
        child: Icon(Icons.settings, color: Colors.black)),
    //Icon(Icons.settings),
    backgroundColor: HexColor('#f9f6e8'),
    elevation: 0,
  );
}*/