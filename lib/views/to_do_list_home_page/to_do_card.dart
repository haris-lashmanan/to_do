import 'package:flutter/material.dart';
import 'package:todolist/data/models/to_do_list_model/to_do_list_model.dart';
import 'package:todolist/utils/theme/appTheme.dart';

class TodoCard extends StatelessWidget {
  final ToDoListModel todo;

  const TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppThemes.white,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: Icon(
          todo.completed! ? Icons.check_circle : Icons.circle_outlined,
          color: todo.completed! ? AppThemes.green : AppThemes.grey,
        ),
        title: Text(
          todo.title!,
          style: const TextStyle(fontWeight: FontWeight.w600),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text('ID: ${todo.id} • User: ${todo.userId}'),
        trailing: Text(
          todo.completed! ? 'Completed' : 'Pending',
          style: TextStyle(
            color: todo.completed! ? AppThemes.green : AppThemes.orange,
          ),
        ),
      ),
    );
  }
}
