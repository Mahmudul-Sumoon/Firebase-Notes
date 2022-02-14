// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notes_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotesDto _$NotesDtoFromJson(Map<String, dynamic> json) {
  return _NotesDto.fromJson(json);
}

/// @nodoc
class _$NotesDtoTearOff {
  const _$NotesDtoTearOff();

  _NotesDto call(
      {@JsonKey(ignore: true) String? id,
      required String? body,
      required int? color,
      required List<TodoItemDto>? todos,
      @ServerTimeStampConverter() required FieldValue? serverTimeStamp}) {
    return _NotesDto(
      id: id,
      body: body,
      color: color,
      todos: todos,
      serverTimeStamp: serverTimeStamp,
    );
  }

  NotesDto fromJson(Map<String, Object?> json) {
    return NotesDto.fromJson(json);
  }
}

/// @nodoc
const $NotesDto = _$NotesDtoTearOff();

/// @nodoc
mixin _$NotesDto {
// ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  int? get color => throw _privateConstructorUsedError;
  List<TodoItemDto>? get todos => throw _privateConstructorUsedError;
  @ServerTimeStampConverter()
  FieldValue? get serverTimeStamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotesDtoCopyWith<NotesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesDtoCopyWith<$Res> {
  factory $NotesDtoCopyWith(NotesDto value, $Res Function(NotesDto) then) =
      _$NotesDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String? body,
      int? color,
      List<TodoItemDto>? todos,
      @ServerTimeStampConverter() FieldValue? serverTimeStamp});
}

/// @nodoc
class _$NotesDtoCopyWithImpl<$Res> implements $NotesDtoCopyWith<$Res> {
  _$NotesDtoCopyWithImpl(this._value, this._then);

  final NotesDto _value;
  // ignore: unused_field
  final $Res Function(NotesDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? body = freezed,
    Object? color = freezed,
    Object? todos = freezed,
    Object? serverTimeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoItemDto>?,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp // ignore: cast_nullable_to_non_nullable
              as FieldValue?,
    ));
  }
}

/// @nodoc
abstract class _$NotesDtoCopyWith<$Res> implements $NotesDtoCopyWith<$Res> {
  factory _$NotesDtoCopyWith(_NotesDto value, $Res Function(_NotesDto) then) =
      __$NotesDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String? body,
      int? color,
      List<TodoItemDto>? todos,
      @ServerTimeStampConverter() FieldValue? serverTimeStamp});
}

/// @nodoc
class __$NotesDtoCopyWithImpl<$Res> extends _$NotesDtoCopyWithImpl<$Res>
    implements _$NotesDtoCopyWith<$Res> {
  __$NotesDtoCopyWithImpl(_NotesDto _value, $Res Function(_NotesDto) _then)
      : super(_value, (v) => _then(v as _NotesDto));

  @override
  _NotesDto get _value => super._value as _NotesDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? body = freezed,
    Object? color = freezed,
    Object? todos = freezed,
    Object? serverTimeStamp = freezed,
  }) {
    return _then(_NotesDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoItemDto>?,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp // ignore: cast_nullable_to_non_nullable
              as FieldValue?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotesDto extends _NotesDto with DiagnosticableTreeMixin {
  const _$_NotesDto(
      {@JsonKey(ignore: true) this.id,
      required this.body,
      required this.color,
      required this.todos,
      @ServerTimeStampConverter() required this.serverTimeStamp})
      : super._();

  factory _$_NotesDto.fromJson(Map<String, dynamic> json) =>
      _$$_NotesDtoFromJson(json);

  @override // ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String? body;
  @override
  final int? color;
  @override
  final List<TodoItemDto>? todos;
  @override
  @ServerTimeStampConverter()
  final FieldValue? serverTimeStamp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotesDto(id: $id, body: $body, color: $color, todos: $todos, serverTimeStamp: $serverTimeStamp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotesDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('todos', todos))
      ..add(DiagnosticsProperty('serverTimeStamp', serverTimeStamp));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotesDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.todos, todos) &&
            const DeepCollectionEquality()
                .equals(other.serverTimeStamp, serverTimeStamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(todos),
      const DeepCollectionEquality().hash(serverTimeStamp));

  @JsonKey(ignore: true)
  @override
  _$NotesDtoCopyWith<_NotesDto> get copyWith =>
      __$NotesDtoCopyWithImpl<_NotesDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotesDtoToJson(this);
  }
}

abstract class _NotesDto extends NotesDto {
  const factory _NotesDto(
          {@JsonKey(ignore: true) String? id,
          required String? body,
          required int? color,
          required List<TodoItemDto>? todos,
          @ServerTimeStampConverter() required FieldValue? serverTimeStamp}) =
      _$_NotesDto;
  const _NotesDto._() : super._();

  factory _NotesDto.fromJson(Map<String, dynamic> json) = _$_NotesDto.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  String? get id;
  @override
  String? get body;
  @override
  int? get color;
  @override
  List<TodoItemDto>? get todos;
  @override
  @ServerTimeStampConverter()
  FieldValue? get serverTimeStamp;
  @override
  @JsonKey(ignore: true)
  _$NotesDtoCopyWith<_NotesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

TodoItemDto _$TodoItemDtoFromJson(Map<String, dynamic> json) {
  return _TodoItemDto.fromJson(json);
}

/// @nodoc
class _$TodoItemDtoTearOff {
  const _$TodoItemDtoTearOff();

  _TodoItemDto call(
      {required String? id, required String? name, required bool? done}) {
    return _TodoItemDto(
      id: id,
      name: name,
      done: done,
    );
  }

  TodoItemDto fromJson(Map<String, Object?> json) {
    return TodoItemDto.fromJson(json);
  }
}

/// @nodoc
const $TodoItemDto = _$TodoItemDtoTearOff();

/// @nodoc
mixin _$TodoItemDto {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool? get done => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoItemDtoCopyWith<TodoItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoItemDtoCopyWith<$Res> {
  factory $TodoItemDtoCopyWith(
          TodoItemDto value, $Res Function(TodoItemDto) then) =
      _$TodoItemDtoCopyWithImpl<$Res>;
  $Res call({String? id, String? name, bool? done});
}

/// @nodoc
class _$TodoItemDtoCopyWithImpl<$Res> implements $TodoItemDtoCopyWith<$Res> {
  _$TodoItemDtoCopyWithImpl(this._value, this._then);

  final TodoItemDto _value;
  // ignore: unused_field
  final $Res Function(TodoItemDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? done = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$TodoItemDtoCopyWith<$Res>
    implements $TodoItemDtoCopyWith<$Res> {
  factory _$TodoItemDtoCopyWith(
          _TodoItemDto value, $Res Function(_TodoItemDto) then) =
      __$TodoItemDtoCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? name, bool? done});
}

/// @nodoc
class __$TodoItemDtoCopyWithImpl<$Res> extends _$TodoItemDtoCopyWithImpl<$Res>
    implements _$TodoItemDtoCopyWith<$Res> {
  __$TodoItemDtoCopyWithImpl(
      _TodoItemDto _value, $Res Function(_TodoItemDto) _then)
      : super(_value, (v) => _then(v as _TodoItemDto));

  @override
  _TodoItemDto get _value => super._value as _TodoItemDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? done = freezed,
  }) {
    return _then(_TodoItemDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoItemDto with DiagnosticableTreeMixin implements _TodoItemDto {
  const _$_TodoItemDto(
      {required this.id, required this.name, required this.done});

  factory _$_TodoItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_TodoItemDtoFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final bool? done;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodoItemDto(id: $id, name: $name, done: $done)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TodoItemDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('done', done));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoItemDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.done, done));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(done));

  @JsonKey(ignore: true)
  @override
  _$TodoItemDtoCopyWith<_TodoItemDto> get copyWith =>
      __$TodoItemDtoCopyWithImpl<_TodoItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoItemDtoToJson(this);
  }
}

abstract class _TodoItemDto implements TodoItemDto {
  const factory _TodoItemDto(
      {required String? id,
      required String? name,
      required bool? done}) = _$_TodoItemDto;

  factory _TodoItemDto.fromJson(Map<String, dynamic> json) =
      _$_TodoItemDto.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  bool? get done;
  @override
  @JsonKey(ignore: true)
  _$TodoItemDtoCopyWith<_TodoItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
