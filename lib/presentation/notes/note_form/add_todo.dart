import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:notes_app/appliction/auth/note_form_bloc/note_form_bloc_bloc.dart';
import 'package:notes_app/infrastrructure/notes/todo_primitive.dart';
import 'package:notes_app/presentation/notes/note_form/form_todo_extension.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteFormBlocBloc, NoteFormBlocState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        context.formTodos = state.note.todos.value.fold(
          (_) => listOf<TodoItemPrimitive>(),
          (todoItemList) => todoItemList.map(
            TodoItemPrimitive.fromDomain,
          ),
        );
      },
      buildWhen: (p, c) => p.note.todos.isFull != c.note.todos.isFull,
      builder: (context, state) {
        return ListTile(
          enabled: !state.note.todos.isFull,
          title: const Text('Add Todo'),
          leading: const Padding(
            padding: EdgeInsets.all(12),
            child: Icon(Icons.add),
          ),
          onTap: () {
            context.formTodos =
                context.formTodos.plusElement(TodoItemPrimitive.empty());
            BlocProvider.of<NoteFormBlocBloc>(context).add(
              NoteFormBlocEvent.todosChanged(context.formTodos),
            );
          },
        );
      },
    );
  }
}
