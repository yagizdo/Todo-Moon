import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/Models/todo.dart';

class TodoDescription extends StatelessWidget {
  TodoDescription({Key? key, required this.todo, required this.textFontSize})
      : super(key: key);
  Todo todo;
  double textFontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
      child: Container(
        alignment: Alignment.topCenter,
        child: AutoSizeText(
          todo.description,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: textFontSize),
        ),
      ),
    );
  }
}
