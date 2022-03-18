import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Widgets/Profile/name_text.dart';
import 'package:todo_app/Widgets/Profile/profile_circle.dart';

import '../Widgets/Profile/change_name_btn.dart';
import '../Widgets/Profile/clear_todos_btn.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f9f6e8'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: LayoutBuilder(builder: (context, constraints) {
            print('width : ${constraints.maxWidth}');
            print('height : ${constraints.maxHeight}');
            return Column(
              children: [
                ProfileImg(),
                NameText(),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40, left: 15.0),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                    ),
                    CupertinoListTile(
                      title: Text('Change Name'),
                      trailing:
                          // for iphone 7,iphone se - height 567 | iphone 8 plus - height 636
                          constraints.maxHeight == 567 ||
                                  constraints.maxHeight == 636
                              ? ChangeNameBTN(
                                  width: 3,
                                  height: 21,
                                )
                              // for iphone xs, iphone 11 pro, iphone 13 mini - height 678
                              : constraints.maxHeight == 678
                                  ? ChangeNameBTN(
                                      width: 3,
                                      height: 24,
                                    )
                                  // for iphone 11, iphone 13 pro max - height 762
                                  : constraints.maxHeight == 762 ||
                                          constraints.maxHeight == 792
                                      ? ChangeNameBTN(
                                          width: 3,
                                          height: 26,
                                        )
                                      : ChangeNameBTN(
                                          width: 3,
                                          height: 18,
                                        ),
                    ),
                    CupertinoListTile(
                      title: Text('Delete All Completed Todos'),
                      trailing: ClearTodosBtn(),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
