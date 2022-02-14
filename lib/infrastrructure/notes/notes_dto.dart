import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:notes_app/domain/core/value_objects.dart';
import 'package:notes_app/domain/note/note.dart';
import 'package:notes_app/domain/note/todo_item.dart';
import 'package:notes_app/domain/note/value_object.dart';

part 'notes_dto.freezed.dart';
part 'notes_dto.g.dart';

NotesDto notesDtoFromJson(String str) =>
    NotesDto.fromJson(json.decode(str) as Map<String, dynamic>);
String notesDtoToJson(NotesDto data) => json.encode(data.toJson());

@freezed
abstract class NotesDto implements _$NotesDto {
  const NotesDto._();
  const factory NotesDto({
    // ignore: invalid_annotation_target
    @JsonKey(ignore: true) String? id,
    required String? body,
    required int? color,
    required List<TodoItemDto>? todos,
    @ServerTimeStampConverter() required FieldValue? serverTimeStamp,
  }) = _NotesDto;
  //আনার ক্ষেত্রে
  factory NotesDto.fromDomain(Note note) {
    return NotesDto(
      id: note.id.getOrCrash(),
      body: note.body.getOrCrash(),
      color: note.color.getOrCrash().value,
      serverTimeStamp: FieldValue.serverTimestamp(),
      //modifiy .g for todos 'todos': instance.todos?.map((e) => e.toJson()).toList(),
      todos: note.todos
          .getOrCrash()
          .map(
            TodoItemDto.fromDomain,
          )
          .asList(),
    );
  }
  //পাঠানোর ক্ষেত্রে
  Note toDomain() {
    return Note(
      id: UniqueId.fromUniqueIdString(id!),
      body: NoteBody(body!),
      color: NoteColor(Color(color!)),
      todos: TodoList(
        todos!.map((todoItemDto) => todoItemDto.toDomain()).toImmutableList(),
      ),
    );
  }

  factory NotesDto.fromJson(Map<String, dynamic> json) =>
      _$NotesDtoFromJson(json);
  factory NotesDto.fromFirestore(DocumentSnapshot doc) {
    // final data = Map<String, dynamic>.from(doc.data()! as Map<String, dynamic>);
    // ignore: cast_nullable_to_non_nullable
    return NotesDto.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }
}

@freezed
abstract class TodoItemDto implements _$TodoItemDto {
  const factory TodoItemDto({
    required String? id,
    required String? name,
    required bool? done,
  }) = _TodoItemDto;
  factory TodoItemDto.fromDomain(TodoItem todoItem) {
    return TodoItemDto(
      name: todoItem.name.getOrCrash(),
      id: todoItem.id.getOrCrash(),
      done: todoItem.isDone,
    );
  }
  TodoItem toDomain() {
    return TodoItem(
      name: TodoName(name!),
      id: UniqueId.fromUniqueIdString(id!),
      isDone: done!,
    );
  }

  factory TodoItemDto.fromJson(Map<String, dynamic> json) =>
      _$TodoItemDtoFromJson(json);
}

class ServerTimeStampConverter implements JsonConverter<FieldValue?, Object?> {
  const ServerTimeStampConverter();
  @override
  FieldValue? fromJson(Object? json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object? toJson(FieldValue? fieldValue) => fieldValue;
}

//quicktype.io

/*
{
  "id":"",
  "body":"",
  "color":123
  "todos":[
{
      "id":"",
    "name":"",
    "done":false
},
{
      "id":"",
    "name":"",
    "done":false
}
  ],
}
 */
