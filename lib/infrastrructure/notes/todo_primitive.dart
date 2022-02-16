import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app/domain/core/value_objects.dart';
import 'package:notes_app/domain/note/todo_item.dart';
import 'package:notes_app/domain/note/value_object.dart';
part 'todo_primitive.freezed.dart';

@freezed
abstract class TodoItemPrimitive implements _$TodoItemPrimitive {
  const TodoItemPrimitive._();
  const factory TodoItemPrimitive({
    required UniqueId id,
    required String name,
    required bool done,
  }) = _TodoItemPrimitive;

  factory TodoItemPrimitive.empty() => TodoItemPrimitive(
        id: UniqueId(),
        name: '',
        done: false,
      );
  factory TodoItemPrimitive.fromDomain(TodoItem todoItem) {
    return TodoItemPrimitive(
      id: todoItem.id,
      name: todoItem.name.getOrCrash(),
      done: todoItem.isDone,
    );
  }
  TodoItem toDomain() {
    return TodoItem(
      id: id,
      name: TodoName(name),
      isDone: done,
    );
  }
}