import 'package:flutter/material.dart';
import '../../Models/todo.dart';

class TodoInfoSection extends StatelessWidget {
  const TodoInfoSection({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    DateTime todoDate =
        DateTime.fromMillisecondsSinceEpoch(todo.dateMilliseconds);
    DateTime todoTime =
        DateTime.fromMillisecondsSinceEpoch(todo.timeMilliseconds);
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          _categoryText(todo.category, context),
          const SizedBox(height: 12),
          Text(
            todo.title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 16, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    Text(
                      ' ${todoDate.day.toString().padLeft(2, '0')}/${todoDate.month.toString().padLeft(2, '0')}/${todoDate.year}',
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time_outlined),
                    Text(
                      ' ${todoTime.hour.toString().padLeft(2, '0')}:${todoTime.minute.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _categoryText(String categoryName, BuildContext context) {
  return Container(
    height: 25,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40.0),
      color: Theme.of(context).colorScheme.secondaryContainer,
    ),
    child: Center(
      child: Text(
        categoryName,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ),
  );
}
