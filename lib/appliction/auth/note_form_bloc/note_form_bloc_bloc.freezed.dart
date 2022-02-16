// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_form_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NoteFormBlocEventTearOff {
  const _$NoteFormBlocEventTearOff();

  _Initialized initialized(Option<Note> initialNoteOption) {
    return _Initialized(
      initialNoteOption,
    );
  }

  _BodyPressed bodyPressed(String bodyStr) {
    return _BodyPressed(
      bodyStr,
    );
  }

  _ColorChanged colorChanged(Color color) {
    return _ColorChanged(
      color,
    );
  }

  _TodosChanged todosChanged(KtList<TodoItemPrimitive> todos) {
    return _TodosChanged(
      todos,
    );
  }

  _Saved saved() {
    return const _Saved();
  }
}

/// @nodoc
const $NoteFormBlocEvent = _$NoteFormBlocEventTearOff();

/// @nodoc
mixin _$NoteFormBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option<Note> initialNoteOption) initialized,
    required TResult Function(String bodyStr) bodyPressed,
    required TResult Function(Color color) colorChanged,
    required TResult Function(KtList<TodoItemPrimitive> todos) todosChanged,
    required TResult Function() saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Option<Note> initialNoteOption)? initialized,
    TResult Function(String bodyStr)? bodyPressed,
    TResult Function(Color color)? colorChanged,
    TResult Function(KtList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option<Note> initialNoteOption)? initialized,
    TResult Function(String bodyStr)? bodyPressed,
    TResult Function(Color color)? colorChanged,
    TResult Function(KtList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_BodyPressed value) bodyPressed,
    required TResult Function(_ColorChanged value) colorChanged,
    required TResult Function(_TodosChanged value) todosChanged,
    required TResult Function(_Saved value) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_BodyPressed value)? bodyPressed,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_TodosChanged value)? todosChanged,
    TResult Function(_Saved value)? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_BodyPressed value)? bodyPressed,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_TodosChanged value)? todosChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteFormBlocEventCopyWith<$Res> {
  factory $NoteFormBlocEventCopyWith(
          NoteFormBlocEvent value, $Res Function(NoteFormBlocEvent) then) =
      _$NoteFormBlocEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoteFormBlocEventCopyWithImpl<$Res>
    implements $NoteFormBlocEventCopyWith<$Res> {
  _$NoteFormBlocEventCopyWithImpl(this._value, this._then);

  final NoteFormBlocEvent _value;
  // ignore: unused_field
  final $Res Function(NoteFormBlocEvent) _then;
}

/// @nodoc
abstract class _$InitializedCopyWith<$Res> {
  factory _$InitializedCopyWith(
          _Initialized value, $Res Function(_Initialized) then) =
      __$InitializedCopyWithImpl<$Res>;
  $Res call({Option<Note> initialNoteOption});
}

/// @nodoc
class __$InitializedCopyWithImpl<$Res>
    extends _$NoteFormBlocEventCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(
      _Initialized _value, $Res Function(_Initialized) _then)
      : super(_value, (v) => _then(v as _Initialized));

  @override
  _Initialized get _value => super._value as _Initialized;

  @override
  $Res call({
    Object? initialNoteOption = freezed,
  }) {
    return _then(_Initialized(
      initialNoteOption == freezed
          ? _value.initialNoteOption
          : initialNoteOption // ignore: cast_nullable_to_non_nullable
              as Option<Note>,
    ));
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(this.initialNoteOption);

  @override
  final Option<Note> initialNoteOption;

  @override
  String toString() {
    return 'NoteFormBlocEvent.initialized(initialNoteOption: $initialNoteOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initialized &&
            const DeepCollectionEquality()
                .equals(other.initialNoteOption, initialNoteOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(initialNoteOption));

  @JsonKey(ignore: true)
  @override
  _$InitializedCopyWith<_Initialized> get copyWith =>
      __$InitializedCopyWithImpl<_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option<Note> initialNoteOption) initialized,
    required TResult Function(String bodyStr) bodyPressed,
    required TResult Function(Color color) colorChanged,
    required TResult Function(KtList<TodoItemPrimitive> todos) todosChanged,
    required TResult Function() saved,
  }) {
    return initialized(initialNoteOption);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Option<Note> initialNoteOption)? initialized,
    TResult Function(String bodyStr)? bodyPressed,
    TResult Function(Color color)? colorChanged,
    TResult Function(KtList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
  }) {
    return initialized?.call(initialNoteOption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option<Note> initialNoteOption)? initialized,
    TResult Function(String bodyStr)? bodyPressed,
    TResult Function(Color color)? colorChanged,
    TResult Function(KtList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(initialNoteOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_BodyPressed value) bodyPressed,
    required TResult Function(_ColorChanged value) colorChanged,
    required TResult Function(_TodosChanged value) todosChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_BodyPressed value)? bodyPressed,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_TodosChanged value)? todosChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_BodyPressed value)? bodyPressed,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_TodosChanged value)? todosChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements NoteFormBlocEvent {
  const factory _Initialized(Option<Note> initialNoteOption) = _$_Initialized;

  Option<Note> get initialNoteOption;
  @JsonKey(ignore: true)
  _$InitializedCopyWith<_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BodyPressedCopyWith<$Res> {
  factory _$BodyPressedCopyWith(
          _BodyPressed value, $Res Function(_BodyPressed) then) =
      __$BodyPressedCopyWithImpl<$Res>;
  $Res call({String bodyStr});
}

/// @nodoc
class __$BodyPressedCopyWithImpl<$Res>
    extends _$NoteFormBlocEventCopyWithImpl<$Res>
    implements _$BodyPressedCopyWith<$Res> {
  __$BodyPressedCopyWithImpl(
      _BodyPressed _value, $Res Function(_BodyPressed) _then)
      : super(_value, (v) => _then(v as _BodyPressed));

  @override
  _BodyPressed get _value => super._value as _BodyPressed;

  @override
  $Res call({
    Object? bodyStr = freezed,
  }) {
    return _then(_BodyPressed(
      bodyStr == freezed
          ? _value.bodyStr
          : bodyStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BodyPressed implements _BodyPressed {
  const _$_BodyPressed(this.bodyStr);

  @override
  final String bodyStr;

  @override
  String toString() {
    return 'NoteFormBlocEvent.bodyPressed(bodyStr: $bodyStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BodyPressed &&
            const DeepCollectionEquality().equals(other.bodyStr, bodyStr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(bodyStr));

  @JsonKey(ignore: true)
  @override
  _$BodyPressedCopyWith<_BodyPressed> get copyWith =>
      __$BodyPressedCopyWithImpl<_BodyPressed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option<Note> initialNoteOption) initialized,
    required TResult Function(String bodyStr) bodyPressed,
    required TResult Function(Color color) colorChanged,
    required TResult Function(KtList<TodoItemPrimitive> todos) todosChanged,
    required TResult Function() saved,
  }) {
    return bodyPressed(bodyStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Option<Note> initialNoteOption)? initialized,
    TResult Function(String bodyStr)? bodyPressed,
    TResult Function(Color color)? colorChanged,
    TResult Function(KtList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
  }) {
    return bodyPressed?.call(bodyStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option<Note> initialNoteOption)? initialized,
    TResult Function(String bodyStr)? bodyPressed,
    TResult Function(Color color)? colorChanged,
    TResult Function(KtList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (bodyPressed != null) {
      return bodyPressed(bodyStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_BodyPressed value) bodyPressed,
    required TResult Function(_ColorChanged value) colorChanged,
    required TResult Function(_TodosChanged value) todosChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return bodyPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_BodyPressed value)? bodyPressed,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_TodosChanged value)? todosChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return bodyPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_BodyPressed value)? bodyPressed,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_TodosChanged value)? todosChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (bodyPressed != null) {
      return bodyPressed(this);
    }
    return orElse();
  }
}

abstract class _BodyPressed implements NoteFormBlocEvent {
  const factory _BodyPressed(String bodyStr) = _$_BodyPressed;

  String get bodyStr;
  @JsonKey(ignore: true)
  _$BodyPressedCopyWith<_BodyPressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ColorChangedCopyWith<$Res> {
  factory _$ColorChangedCopyWith(
          _ColorChanged value, $Res Function(_ColorChanged) then) =
      __$ColorChangedCopyWithImpl<$Res>;
  $Res call({Color color});
}

/// @nodoc
class __$ColorChangedCopyWithImpl<$Res>
    extends _$NoteFormBlocEventCopyWithImpl<$Res>
    implements _$ColorChangedCopyWith<$Res> {
  __$ColorChangedCopyWithImpl(
      _ColorChanged _value, $Res Function(_ColorChanged) _then)
      : super(_value, (v) => _then(v as _ColorChanged));

  @override
  _ColorChanged get _value => super._value as _ColorChanged;

  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(_ColorChanged(
      color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_ColorChanged implements _ColorChanged {
  const _$_ColorChanged(this.color);

  @override
  final Color color;

  @override
  String toString() {
    return 'NoteFormBlocEvent.colorChanged(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ColorChanged &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  _$ColorChangedCopyWith<_ColorChanged> get copyWith =>
      __$ColorChangedCopyWithImpl<_ColorChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option<Note> initialNoteOption) initialized,
    required TResult Function(String bodyStr) bodyPressed,
    required TResult Function(Color color) colorChanged,
    required TResult Function(KtList<TodoItemPrimitive> todos) todosChanged,
    required TResult Function() saved,
  }) {
    return colorChanged(color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Option<Note> initialNoteOption)? initialized,
    TResult Function(String bodyStr)? bodyPressed,
    TResult Function(Color color)? colorChanged,
    TResult Function(KtList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
  }) {
    return colorChanged?.call(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option<Note> initialNoteOption)? initialized,
    TResult Function(String bodyStr)? bodyPressed,
    TResult Function(Color color)? colorChanged,
    TResult Function(KtList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (colorChanged != null) {
      return colorChanged(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_BodyPressed value) bodyPressed,
    required TResult Function(_ColorChanged value) colorChanged,
    required TResult Function(_TodosChanged value) todosChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return colorChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_BodyPressed value)? bodyPressed,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_TodosChanged value)? todosChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return colorChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_BodyPressed value)? bodyPressed,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_TodosChanged value)? todosChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (colorChanged != null) {
      return colorChanged(this);
    }
    return orElse();
  }
}

abstract class _ColorChanged implements NoteFormBlocEvent {
  const factory _ColorChanged(Color color) = _$_ColorChanged;

  Color get color;
  @JsonKey(ignore: true)
  _$ColorChangedCopyWith<_ColorChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TodosChangedCopyWith<$Res> {
  factory _$TodosChangedCopyWith(
          _TodosChanged value, $Res Function(_TodosChanged) then) =
      __$TodosChangedCopyWithImpl<$Res>;
  $Res call({KtList<TodoItemPrimitive> todos});
}

/// @nodoc
class __$TodosChangedCopyWithImpl<$Res>
    extends _$NoteFormBlocEventCopyWithImpl<$Res>
    implements _$TodosChangedCopyWith<$Res> {
  __$TodosChangedCopyWithImpl(
      _TodosChanged _value, $Res Function(_TodosChanged) _then)
      : super(_value, (v) => _then(v as _TodosChanged));

  @override
  _TodosChanged get _value => super._value as _TodosChanged;

  @override
  $Res call({
    Object? todos = freezed,
  }) {
    return _then(_TodosChanged(
      todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as KtList<TodoItemPrimitive>,
    ));
  }
}

/// @nodoc

class _$_TodosChanged implements _TodosChanged {
  const _$_TodosChanged(this.todos);

  @override
  final KtList<TodoItemPrimitive> todos;

  @override
  String toString() {
    return 'NoteFormBlocEvent.todosChanged(todos: $todos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodosChanged &&
            const DeepCollectionEquality().equals(other.todos, todos));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(todos));

  @JsonKey(ignore: true)
  @override
  _$TodosChangedCopyWith<_TodosChanged> get copyWith =>
      __$TodosChangedCopyWithImpl<_TodosChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option<Note> initialNoteOption) initialized,
    required TResult Function(String bodyStr) bodyPressed,
    required TResult Function(Color color) colorChanged,
    required TResult Function(KtList<TodoItemPrimitive> todos) todosChanged,
    required TResult Function() saved,
  }) {
    return todosChanged(todos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Option<Note> initialNoteOption)? initialized,
    TResult Function(String bodyStr)? bodyPressed,
    TResult Function(Color color)? colorChanged,
    TResult Function(KtList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
  }) {
    return todosChanged?.call(todos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option<Note> initialNoteOption)? initialized,
    TResult Function(String bodyStr)? bodyPressed,
    TResult Function(Color color)? colorChanged,
    TResult Function(KtList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (todosChanged != null) {
      return todosChanged(todos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_BodyPressed value) bodyPressed,
    required TResult Function(_ColorChanged value) colorChanged,
    required TResult Function(_TodosChanged value) todosChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return todosChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_BodyPressed value)? bodyPressed,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_TodosChanged value)? todosChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return todosChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_BodyPressed value)? bodyPressed,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_TodosChanged value)? todosChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (todosChanged != null) {
      return todosChanged(this);
    }
    return orElse();
  }
}

abstract class _TodosChanged implements NoteFormBlocEvent {
  const factory _TodosChanged(KtList<TodoItemPrimitive> todos) =
      _$_TodosChanged;

  KtList<TodoItemPrimitive> get todos;
  @JsonKey(ignore: true)
  _$TodosChangedCopyWith<_TodosChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SavedCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) then) =
      __$SavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SavedCopyWithImpl<$Res> extends _$NoteFormBlocEventCopyWithImpl<$Res>
    implements _$SavedCopyWith<$Res> {
  __$SavedCopyWithImpl(_Saved _value, $Res Function(_Saved) _then)
      : super(_value, (v) => _then(v as _Saved));

  @override
  _Saved get _value => super._value as _Saved;
}

/// @nodoc

class _$_Saved implements _Saved {
  const _$_Saved();

  @override
  String toString() {
    return 'NoteFormBlocEvent.saved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option<Note> initialNoteOption) initialized,
    required TResult Function(String bodyStr) bodyPressed,
    required TResult Function(Color color) colorChanged,
    required TResult Function(KtList<TodoItemPrimitive> todos) todosChanged,
    required TResult Function() saved,
  }) {
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Option<Note> initialNoteOption)? initialized,
    TResult Function(String bodyStr)? bodyPressed,
    TResult Function(Color color)? colorChanged,
    TResult Function(KtList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
  }) {
    return saved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option<Note> initialNoteOption)? initialized,
    TResult Function(String bodyStr)? bodyPressed,
    TResult Function(Color color)? colorChanged,
    TResult Function(KtList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_BodyPressed value) bodyPressed,
    required TResult Function(_ColorChanged value) colorChanged,
    required TResult Function(_TodosChanged value) todosChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_BodyPressed value)? bodyPressed,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_TodosChanged value)? todosChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_BodyPressed value)? bodyPressed,
    TResult Function(_ColorChanged value)? colorChanged,
    TResult Function(_TodosChanged value)? todosChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _Saved implements NoteFormBlocEvent {
  const factory _Saved() = _$_Saved;
}

/// @nodoc
class _$NoteFormBlocStateTearOff {
  const _$NoteFormBlocStateTearOff();

  _NoteFormBlocState call(
      {required Note note,
      required AutovalidateMode showErrorMessages,
      required bool isEditing,
      required bool isSaving,
      required Option<Either<NoteFailure, Unit>> saveFailureOrSuccessOption}) {
    return _NoteFormBlocState(
      note: note,
      showErrorMessages: showErrorMessages,
      isEditing: isEditing,
      isSaving: isSaving,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $NoteFormBlocState = _$NoteFormBlocStateTearOff();

/// @nodoc
mixin _$NoteFormBlocState {
  Note get note => throw _privateConstructorUsedError;
  AutovalidateMode get showErrorMessages => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  Option<Either<NoteFailure, Unit>> get saveFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteFormBlocStateCopyWith<NoteFormBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteFormBlocStateCopyWith<$Res> {
  factory $NoteFormBlocStateCopyWith(
          NoteFormBlocState value, $Res Function(NoteFormBlocState) then) =
      _$NoteFormBlocStateCopyWithImpl<$Res>;
  $Res call(
      {Note note,
      AutovalidateMode showErrorMessages,
      bool isEditing,
      bool isSaving,
      Option<Either<NoteFailure, Unit>> saveFailureOrSuccessOption});

  $NoteCopyWith<$Res> get note;
}

/// @nodoc
class _$NoteFormBlocStateCopyWithImpl<$Res>
    implements $NoteFormBlocStateCopyWith<$Res> {
  _$NoteFormBlocStateCopyWithImpl(this._value, this._then);

  final NoteFormBlocState _value;
  // ignore: unused_field
  final $Res Function(NoteFormBlocState) _then;

  @override
  $Res call({
    Object? note = freezed,
    Object? showErrorMessages = freezed,
    Object? isEditing = freezed,
    Object? isSaving = freezed,
    Object? saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NoteFailure, Unit>>,
    ));
  }

  @override
  $NoteCopyWith<$Res> get note {
    return $NoteCopyWith<$Res>(_value.note, (value) {
      return _then(_value.copyWith(note: value));
    });
  }
}

/// @nodoc
abstract class _$NoteFormBlocStateCopyWith<$Res>
    implements $NoteFormBlocStateCopyWith<$Res> {
  factory _$NoteFormBlocStateCopyWith(
          _NoteFormBlocState value, $Res Function(_NoteFormBlocState) then) =
      __$NoteFormBlocStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Note note,
      AutovalidateMode showErrorMessages,
      bool isEditing,
      bool isSaving,
      Option<Either<NoteFailure, Unit>> saveFailureOrSuccessOption});

  @override
  $NoteCopyWith<$Res> get note;
}

/// @nodoc
class __$NoteFormBlocStateCopyWithImpl<$Res>
    extends _$NoteFormBlocStateCopyWithImpl<$Res>
    implements _$NoteFormBlocStateCopyWith<$Res> {
  __$NoteFormBlocStateCopyWithImpl(
      _NoteFormBlocState _value, $Res Function(_NoteFormBlocState) _then)
      : super(_value, (v) => _then(v as _NoteFormBlocState));

  @override
  _NoteFormBlocState get _value => super._value as _NoteFormBlocState;

  @override
  $Res call({
    Object? note = freezed,
    Object? showErrorMessages = freezed,
    Object? isEditing = freezed,
    Object? isSaving = freezed,
    Object? saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_NoteFormBlocState(
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NoteFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_NoteFormBlocState implements _NoteFormBlocState {
  const _$_NoteFormBlocState(
      {required this.note,
      required this.showErrorMessages,
      required this.isEditing,
      required this.isSaving,
      required this.saveFailureOrSuccessOption});

  @override
  final Note note;
  @override
  final AutovalidateMode showErrorMessages;
  @override
  final bool isEditing;
  @override
  final bool isSaving;
  @override
  final Option<Either<NoteFailure, Unit>> saveFailureOrSuccessOption;

  @override
  String toString() {
    return 'NoteFormBlocState(note: $note, showErrorMessages: $showErrorMessages, isEditing: $isEditing, isSaving: $isSaving, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoteFormBlocState &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(other.isEditing, isEditing) &&
            const DeepCollectionEquality().equals(other.isSaving, isSaving) &&
            const DeepCollectionEquality().equals(
                other.saveFailureOrSuccessOption, saveFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isEditing),
      const DeepCollectionEquality().hash(isSaving),
      const DeepCollectionEquality().hash(saveFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$NoteFormBlocStateCopyWith<_NoteFormBlocState> get copyWith =>
      __$NoteFormBlocStateCopyWithImpl<_NoteFormBlocState>(this, _$identity);
}

abstract class _NoteFormBlocState implements NoteFormBlocState {
  const factory _NoteFormBlocState(
      {required Note note,
      required AutovalidateMode showErrorMessages,
      required bool isEditing,
      required bool isSaving,
      required Option<Either<NoteFailure, Unit>>
          saveFailureOrSuccessOption}) = _$_NoteFormBlocState;

  @override
  Note get note;
  @override
  AutovalidateMode get showErrorMessages;
  @override
  bool get isEditing;
  @override
  bool get isSaving;
  @override
  Option<Either<NoteFailure, Unit>> get saveFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$NoteFormBlocStateCopyWith<_NoteFormBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
