import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/Pages/detail_screen.dart';
import 'package:todo_app/provider/todos_provider.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({required this.todo, String? key});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          showDragHandle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.85,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            expand: false,
            builder: (_, __) => DetailScreen(todo: todo),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Slidable(
          key: UniqueKey(),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: () {
                Provider.of<TodosProvider>(context, listen: false)
                    .toggleTodo(todo);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Done!"), backgroundColor: Colors.green, duration: Duration(seconds: 1)));
              },
            ),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  Provider.of<TodosProvider>(context, listen: false)
                      .toggleTodo(todo);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Done!"), backgroundColor: Colors.green, duration: Duration(seconds: 1)));
                },
                backgroundColor: Colors.green,
                label: 'Done!',
              )
            ],
          ),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: () {
                Provider.of<TodosProvider>(context, listen: false)
                    .removeTodo(todo);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Removed!"), backgroundColor: Colors.red, duration: Duration(seconds: 1)));
              },
            ),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  Provider.of<TodosProvider>(context, listen: false)
                      .removeTodo(todo);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Removed!"), backgroundColor: Colors.red, duration: Duration(seconds: 1)));
                },
                backgroundColor: Colors.red,
                label: 'Remove!',
              )
            ],
          ),
          child: Card(
            shadowColor: Colors.transparent,
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
            elevation: 20,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                      child: Transform.scale(
                        scale: 1.4,
                        child: Checkbox(
                          shape: const CircleBorder(),
                          checkColor: Colors.white,
                          activeColor: Theme.of(context).colorScheme.primary,
                          value: todo.complete,
                          onChanged: (bool? value) {
                            Provider.of<TodosProvider>(context, listen: false)
                                .toggleTodo(todo);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Done!"), backgroundColor: Colors.green, duration: Duration(seconds: 1)));
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _CategoryText(todo.category),
                        _TitleText(todo.title),
                      ],
                    ),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryText extends StatelessWidget {
  const _CategoryText(this.categoryName);
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Center(
            child: Text(
          categoryName,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              fontWeight: FontWeight.bold,
              fontSize: 10),
        )),
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText(this.titleName);
  final String titleName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Center(
          child: Text(
        titleName,
        maxLines: 2,
        overflow: TextOverflow.fade,
        style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 15),
      )),
    );
  }
}
