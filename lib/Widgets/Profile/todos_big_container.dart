import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/todos_provider.dart';

class TodosBigContainer extends StatelessWidget {
  TodosBigContainer(
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
    return Consumer<TodosProvider>(
      builder: (context, state, child) {
        return Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            color: Color(int.parse('FF$backgroundColor', radix: 16)),
            borderRadius: const BorderRadius.all(
              Radius.circular(14.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: textfontSize,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.h),
              Text(
                '${state.allTodos.length}',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: numberfontSize,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        );
      },
    );
  }
}
