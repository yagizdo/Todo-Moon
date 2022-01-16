import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

class ProfileImg extends StatelessWidget {
  const ProfileImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodosProvider>(
      builder: (context, state, child) => CircleAvatar(
        child: Text(
          '${state.name[0]}${state.surname[0]}',
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
        backgroundColor: HexColor('#ff9d73'),
        radius: 50,
      ),
    );
  }
}
