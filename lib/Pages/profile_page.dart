import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Widgets/Profile/profile_circle.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(391, 850),
      builder: () => Scaffold(
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: 130.h,
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.redAccent,
                            height: 200,
                          ),
                        )
                      ],
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
      ),
    );
  }
}
