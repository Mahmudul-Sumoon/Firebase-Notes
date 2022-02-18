// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotesDto _$$_NotesDtoFromJson(Map<String, dynamic> json) => _$_NotesDto(
      body: json['body'] as String?,
      color: json['color'] as int?,
      todos: (json['todos'] as List<dynamic>?)
          ?.map((e) => TodoItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      serverTimeStamp:
          const ServerTimeStampConverter().fromJson(json['serverTimeStamp']),
    );

Map<String, dynamic> _$$_NotesDtoToJson(_$_NotesDto instance) =>
    <String, dynamic>{
      'body': instance.body,
      'color': instance.color,
      'todos': instance.todos?.map((e) => e.toJson()).toList(),
      'serverTimeStamp':
          const ServerTimeStampConverter().toJson(instance.serverTimeStamp),
    };

_$_TodoItemDto _$$_TodoItemDtoFromJson(Map<String, dynamic> json) =>
    _$_TodoItemDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      done: json['done'] as bool?,
    );

Map<String, dynamic> _$$_TodoItemDtoToJson(_$_TodoItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'done': instance.done,
    };
