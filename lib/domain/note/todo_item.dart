import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app/domain/core/failures.dart';
import 'package:notes_app/domain/core/value_objects.dart';
import 'package:notes_app/domain/note/value_object.dart';
part 'todo_item.freezed.dart';

@freezed
abstract class TodoItem implements _$TodoItem {
  const factory TodoItem({
    required UniqueId id,
    required TodoName name,
    required bool isDone,
  }) = _TodoItem;
  const TodoItem._();
  factory TodoItem.empty() => TodoItem(
        id: UniqueId(),
        name: TodoName(''),
        isDone: false,
      );
  Option<ValueFailure<dynamic>> get failureValue {
    return name.value.fold(some, (r) => none()); //some= (l)=>some(l)
  }
}
