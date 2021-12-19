import 'package:flutter/material.dart';

class TaskInfo extends StatefulWidget {
  const TaskInfo({Key? key}) : super(key: key);

  @override
  _Task_InfoState createState() => _Task_InfoState();
}

class _Task_InfoState extends State<TaskInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Your tasks',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'You have 4 tasks for today',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left : 170.0),
          child: Container(
            width: 30,
            height: 30,
            color: Colors.white,
            child: const Icon(Icons.calendar_today),
          ),
        )
      ],
    );
  }
}
