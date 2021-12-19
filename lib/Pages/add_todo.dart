import 'package:flutter/material.dart';
Widget _textFormFields (String hint, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(left : 20.0, right: 20.0,top : 50.0),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hint
      ),
    ),
  );
}
class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {

  var titleController = TextEditingController();
  var descController = TextEditingController();
  var categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top : 20.0),
        child: Column(
          children: [
            Text('Add Task',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

            _textFormFields('Title', titleController),
            _textFormFields('Description', descController),
            _textFormFields('Category', categoryController),

            Padding(
              padding: const EdgeInsets.only(top : 50.0),
              child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(onPressed: () {}, child: Text('Add Todo'))),
            )
          ],
          ),
      ),
    );
  }
}
