import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Widgets/Profile/name_text.dart';

import '../Widgets/Profile/profile_circle.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.setContext(context);
    return ScreenUtilInit(
      designSize: Size(391, 850),
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
                  ),
                )
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 20.w,
              left: MediaQuery.of(context).size.width / 90.w,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: const [
                    ProfileImg(),
                    NameText(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
