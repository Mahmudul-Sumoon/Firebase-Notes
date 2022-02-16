import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:notes_app/domain/core/errors.dart';
import 'package:notes_app/domain/core/failures.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;
  T getOrCrash() {
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  bool isValid() {
    return value.isRight();
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(left, (r) => right(unit));
  }

  @override
  // ignore: avoid_renaming_method_parameters
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  @override
  factory UniqueId() {
    return UniqueId._(
      // ignore: prefer_const_constructors
      right(Uuid().v1()),
    );
  }
  factory UniqueId.fromUniqueIdString(String uniqueId) {
    //assert(uniqueId != null);
    return UniqueId._(
      right(uniqueId),
    );
  }
  const UniqueId._(this.value);
}
