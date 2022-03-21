import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Widgets/Profile/profile_circle.dart';

import '../Widgets/Profile/todos_container.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(391, 850),
      builder: () => LayoutBuilder(builder: (context, constraints) {
        print('width : ${constraints.maxWidth}');
        print('height : ${constraints.maxHeight}');
        return Scaffold(
          backgroundColor: HexColor('#F9F6E9'),
          appBar: AppBar(
            backgroundColor: HexColor('#F9F6E9'),
            title: const Text(
              'Profile',
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
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
                  Expanded(
                    flex: 6,
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
                            top: constraints.maxHeight == 617 ? 120.h : 100.h),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 18.w),
                              child: Text(
                                'Statistics',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.w),
                              ),
                            ),
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
                            Positioned(
                              top: 250.h,
                              left: 20.w,
                              child: TodosContainer(
                                containerHeight: 160.h,
                                containerWidth: 345.w,
                                numberfontSize: 45.w,
                                textfontSize: 22.w,
                                backgroundColor: '#F9F6E9',
                                text: 'All Todos',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                top: 40.w,
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
