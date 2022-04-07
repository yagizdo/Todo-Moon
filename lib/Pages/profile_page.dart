import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Widgets/Profile/profile_circle.dart';
import 'package:todo_app/translations/locale_keys.g.dart';

import '../Widgets/Profile/todos_stats_comp.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(391, 850),
      builder: () => LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          backgroundColor: HexColor('#F9F6E9'),
          // App Bar
          appBar: AppBar(
            backgroundColor: HexColor('#F9F6E9'),
            title: Text(
              LocaleKeys.profile_title.tr(),
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: HexColor('#F9F6E9'),
                    ),
                  ),
                  // White Container
                  Expanded(
                    flex:
                        // For Pixel 2 - height 633.4285714285714
                        constraints.maxHeight == 633.4285714285714 ? 5 : 7,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: constraints.maxHeight == 617 ||
                                    constraints.maxHeight == 518
                                ? 120.h
                                : 100.h),
                        child: const TodosStats(),
                      ),
                    ),
                  )
                ],
              ),

              // Profile Avatar
              Positioned(
                top: constraints.maxHeight == 617 ? 25.w : 40.w,
                child: ProfileImg(
                  avatarSize: 45.w,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
