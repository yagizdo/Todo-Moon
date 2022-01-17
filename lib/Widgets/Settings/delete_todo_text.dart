import 'package:flutter/material.dart';

class DeleteTodoTitle extends StatelessWidget {
  const DeleteTodoTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top : 20.0),
      child: Text('Todos Settings',style: TextStyle(fontSize: 20),),
    );
  }
}
