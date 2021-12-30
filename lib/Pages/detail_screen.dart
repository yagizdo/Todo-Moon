import 'package:flutter/material.dart';
import 'package:todo_app/Models/todo.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.title,required this.desc}) : super(key: key);
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(title),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(desc),
      ),

    );
  }
}