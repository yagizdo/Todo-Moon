import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

import 'name_text.dart';

class ProfileImg extends StatelessWidget {
  ProfileImg({Key? key, required this.avatarSize}) : super(key: key);
  double avatarSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Consumer<TodosProvider>(
            builder: (context, state, child) => CircleAvatar(
              child: Text(
                '${state.name[0].toUpperCase()}${state.surname[0].toUpperCase()}',
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
              backgroundColor: HexColor('#ff9d73'),
              radius: avatarSize,
            ),
          ),
          const NameText(),
        ],
      ),
    );
  }
}
