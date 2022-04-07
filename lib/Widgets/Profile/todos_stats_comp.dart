import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Widgets/Profile/todos_big_container.dart';
import 'package:todo_app/Widgets/Profile/todos_container.dart';

import '../../translations/locale_keys.g.dart';

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
            LocaleKeys.profile_stats.tr(),
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
            text: LocaleKeys.profile_completed_text.tr(),
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
            textfontSize: context.locale == Locale('en') ? 22.w : 18.w,
            backgroundColor: '#FFC8B4',
            text: LocaleKeys.profile_uncompleted_text.tr(),
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
            text: LocaleKeys.profile_alltasks_text.tr(),
          ),
        )
      ],
    );
  }
}
