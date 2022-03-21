import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

class TodosContainer extends StatelessWidget {
  TodosContainer(
      {Key? key,
      required this.containerHeight,
      required this.containerWidth,
      required this.numberfontSize,
      required this.textfontSize,
      required this.backgroundColor,
      required this.text})
      : super(key: key);
  double containerHeight;
  double containerWidth;
  double numberfontSize;
  double textfontSize;
  String backgroundColor;
  String text;

  @override
  Widget build(BuildContext context) {
    return Consumer<TodosProvider>(builder: (context, state, child) {
      return Container(
        height: containerHeight,
        width: containerWidth,
        decoration: BoxDecoration(
          color: HexColor(backgroundColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(14.0),
          ),
        ),
        child: text.contains('Completed')
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${state.completedTodos.length}',
                    style: TextStyle(
                        color: HexColor('#F9F6E9'),
                        fontSize: numberfontSize,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    text,
                    style: TextStyle(
                        color: HexColor('#F9F6E9'),
                        fontSize: textfontSize,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${state.unCompletedTodos.length}',
                    style: TextStyle(
                        color: HexColor('#F9F6E9'),
                        fontSize: numberfontSize,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    text,
                    style: TextStyle(
                        color: HexColor('#F9F6E9'),
                        fontSize: textfontSize,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
      );
    });
  }
}
