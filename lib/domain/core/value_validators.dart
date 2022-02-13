import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:notes_app/domain/core/failures.dart';

// ignore: require_trailing_commas
Either<ValueFailure<String>, String> validateStringLength(
  String input,
  int max,
) {
  if (input.length <= max) {
    return right(input);
  } else {
    return left(ValueFailure.exceedingLength(failedValue: input, max: max));
  }
}

Either<ValueFailure<String>, String> validateEmptyString(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateMultiLineString(
  String input,
) {
  if (input.contains('\n')) {
    return left(ValueFailure.multiLine(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<KtList<T>>, KtList<T>> validateListTooLong<T>(
  KtList<T> input,
  int max,
) {
  if (input.size <= max) {
    return right(input);
  } else {
    return left(ValueFailure.listTooLong(failedValue: input, max: max));
  }
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r'''^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+''';
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  const passwordRegex = r'''^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).{4,8}$''';
  if (RegExp(passwordRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPassword(failedValue: input));
  }
}
