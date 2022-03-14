import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Widgets/Profile/change_name_btn.dart';
import 'package:todo_app/Widgets/Profile/clear_todos_btn.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 40, left: 15.0),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          CupertinoListTile(
            title: Text('Change Name'),
            trailing: ChangeNameBTN(),
          ),
          CupertinoListTile(
            title: Text('Delete All Completed Todos'),
            trailing: ClearTodosBtn(),
          ),
        ],
      ),
    );
  }
}
