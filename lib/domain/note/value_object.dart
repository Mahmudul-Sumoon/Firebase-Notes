import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:kt_dart/kt.dart';
import 'package:notes_app/domain/core/failures.dart';
import 'package:notes_app/domain/core/value_objects.dart';
import 'package:notes_app/domain/core/value_validators.dart';

class NoteBody extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const max = 3000;

  factory NoteBody(String input) {
    return NoteBody._(
      validateStringLength(input, max).flatMap(validateEmptyString),
    );
  }
  const NoteBody._(this.value);
}

class NoteColor extends ValueObject<Color> {
  @override
  final Either<ValueFailure<Color>, Color> value;
  static const List<Color> predefinedColors = [
    Color(0xfffafafa), // canvas
    Color(0xfffa8072), // salmon
    Color(0xfffedc56), // mustard
    Color(0xffd0f0c0), // tea
    Color(0xfffca3b7), // flamingo
    Color(0xff997950), // tortilla
    Color(0xfffffdd0), // cream
  ];

  factory NoteColor(Color input) {
    return NoteColor._(
      right(input.withOpacity(1)),
    );
  }
  const NoteColor._(this.value);
}

///todo
class TodoName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const max = 30;

  factory TodoName(String input) {
    return TodoName._(
      validateStringLength(input, max)
          .flatMap(validateEmptyString)
          .flatMap(validateMultiLineString),
    );
  }
  const TodoName._(this.value);
}

class TodoList<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;
  static const max = 3;

  factory TodoList(KtList<T> input) {
    return TodoList._(
      validateListTooLong(input, max),
    );
  }
  const TodoList._(this.value);
  int get length => value.getOrElse(emptyList).size;

  bool get isFull => length == max;
}
