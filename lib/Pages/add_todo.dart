import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/Widgets/Todo/custom_tf.dart';
import 'package:todo_app/provider/todos_provider.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var categoryController = TextEditingController();

  SharedPreferences? sp;

  void saveTodo(){
    Todo todo = Todo(title: titleController.text, description: descController.text, category: categoryController.text);

    Provider.of<TodosProvider>(context, listen: false).addTodo(todo);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Text(
                    'Add Task',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTF(hint: 'Title', controller: titleController, labelText: 'Title'),
                CustomTF(hint: 'Description', controller: descController, labelText: 'Description'),
                CustomTF(hint: 'Category', controller: categoryController, labelText: 'Category'),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orangeAccent),
                          onPressed: () {
                            setState(() {
                              if(formKey.currentState!.validate()) {
                                saveTodo();
                                titleController.text = '';
                                descController.text = '';
                                categoryController.text = '';
                              }
                            });
                          },
                          child: const Text('Add Todo'))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
