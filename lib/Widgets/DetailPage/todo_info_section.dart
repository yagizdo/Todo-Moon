import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Models/todo.dart';

class TodoInfoSection extends StatelessWidget {
  TodoInfoSection({Key? key, required this.todo}) : super(key: key);
  Todo todo;

  @override
  Widget build(BuildContext context) {
    DateTime todoDate =
        DateTime.fromMillisecondsSinceEpoch(todo.dateMilliseconds);
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          categoryText(todo.category, context),
          SizedBox(
            height: 20.h,
          ),
          Text(
            todo.title,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: HexColor('#393939'),
                fontSize: 24),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                ),
                Text(
                  ' ${todoDate.day.toString().padLeft(2, '0')}/${todoDate.month.toString().padLeft(2, '0')}/${todoDate.year}',
                  style: TextStyle(
                    fontSize: 15,
                    color: HexColor('#393939'),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                // Todos time part
                Padding(
                  padding: EdgeInsets.only(left: 135.w),
                  child: const Icon(
                    Icons.access_time_outlined,
                  ),
                ),
                Text(
                  ' ${todoDate.hour.toString().padLeft(2, '0')}:${todoDate.minute.toString().padLeft(2,'0')}',
                  style: TextStyle(
                    fontSize: 15,
                    color: HexColor('#393939'),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget categoryText(String categoryName, BuildContext context) {
  return Container(
    height: 25.h,
    width: 140.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40.0),
      color: HexColor('#d3e3f2'),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Center(
        child: Text(
          categoryName,
          style: const TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    ),
  );
}
