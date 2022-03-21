import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Widgets/Profile/todos_big_container.dart';
import 'package:todo_app/Widgets/Profile/todos_container.dart';

class TodosStats extends StatelessWidget {
  const TodosStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18.w),
          child: Text(
            'Statistics',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.w,
              color: HexColor('#393939'),
            ),
          ),
        ),
        // Completed Todos
        Positioned(
          top: 50.h,
          left: 20.w,
          child: TodosContainer(
            containerHeight: 160.h,
            containerWidth: 160.w,
            numberfontSize: 45.w,
            textfontSize: 22.w,
            backgroundColor: '#FF9D78',
            text: 'Completed',
          ),
        ),

        // Uncompleted Todos
        Positioned(
          top: 50.h,
          left: 205.w,
          child: TodosContainer(
            containerHeight: 160.h,
            containerWidth: 160.w,
            numberfontSize: 45.w,
            textfontSize: 22.w,
            backgroundColor: '#FFC8B4',
            text: 'Uncompleted',
          ),
        ),

        // All Todos
        Positioned(
          top: 240.h,
          left: 20.w,
          child: TodosBigContainer(
            containerHeight: 160.h,
            containerWidth: 345.w,
            numberfontSize: 45.w,
            textfontSize: 22.w,
            backgroundColor: '#F9F6E9',
            text: 'All Todos',
          ),
        )
      ],
    );
  }
}
