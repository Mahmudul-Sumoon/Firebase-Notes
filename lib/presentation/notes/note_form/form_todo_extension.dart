import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:notes_app/infrastrructure/notes/todo_primitive.dart';
import 'package:provider/provider.dart';

extension FormTodosX on BuildContext {
  KtList<TodoItemPrimitive> get formTodos =>
      Provider.of<FormTodo>(this, listen: false).value;

  set formTodos(KtList<TodoItemPrimitive> value) =>
      Provider.of<FormTodo>(this, listen: false).value = value;
}
