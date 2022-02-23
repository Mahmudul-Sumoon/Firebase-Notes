import 'package:flutter/material.dart';
import 'package:notes_app/domain/note/todo_item.dart';

class NoteDisplay extends StatelessWidget {
  final TodoItem todo;
  const NoteDisplay({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (todo.isDone)
          Icon(
            Icons.check_box,
            color: Colors.grey.shade800,
          ),
        if (!todo.isDone)
          Icon(
            Icons.check_box_outline_blank,
            color: Colors.grey.shade700,
          ),
        Text(
          todo.name.getOrCrash(),
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
