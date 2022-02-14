import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:notes_app/domain/core/failures.dart';
import 'package:notes_app/domain/core/value_objects.dart';
import 'package:notes_app/domain/note/todo_item.dart';
import 'package:notes_app/domain/note/value_object.dart';
part 'note.freezed.dart';

@freezed
abstract class Note implements _$Note {
  const factory Note({
    required UniqueId id,
    required NoteBody body,
    required NoteColor color,
    required TodoList<TodoItem> todos,
  }) = _Note;
  const Note._();
  factory Note.empty() => Note(
        id: UniqueId(),
        body: NoteBody(''),
        color: NoteColor(NoteColor.predefinedColors[0]),
        todos: TodoList(emptyList()),
      );

  Option<ValueFailure<dynamic>> get failureValue {
    return body.failureOrUnit
        .andThen<Unit>(todos.failureOrUnit)
        .andThen<Unit>(
          todos
              .getOrCrash()
              .map((item) => item.failureValue)
              .filter((item) => item.isSome())
              .getOrElse(0, (_) => none())
              //none mane tik ache tai left e right
              .fold(() => right(unit), left),
        )
        .fold(some, (_) => none());
  }
}
