# notes_app

## Class 1: Authentication of email and password
- create immutable value object class in domain/core for relying on generics to allow the value to be of any type.
```
@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
```
- create EmailAddress and Password class in domain/auth which extend immutable value object class.
```
class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}
```
- create value_validators in domain/core for validating email and password by using regexlib and dartz.
```
Either<ValueFailure<String>, String> validatePassword(String input) {
  const passwordRegex = r"""^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).{4,8}$""";
  if (RegExp(passwordRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPassword(failedValue: input));
  }
}

```
- create failures class for value failure in email and password with the help of freezed_annotation.
```
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.invalidPassword({
    required T failedValue,
  }) = InvalidPassword<T>;
}

```