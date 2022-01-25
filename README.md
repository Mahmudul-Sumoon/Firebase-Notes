# Domain Driven Design (DDD) with Firebase

## Class 1: Authentication of email and password
- create immutable value object class in domain/core for relying on generics to allow the value to be of any type.
```dart
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
```dart
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
```dart
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
```dart
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

## Class 2: Authentication Facade

- create interface for signIn and Register
```dart
abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailandPassword(
      {required EmailAddress emailAddress, required Password password});
  Future<Either<AuthFailure, Unit>> signinWithEmailandPassword(
      {required EmailAddress emailAddress, required Password password});
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
```
- create failure class for signIn and Register if anything wrong
```dart
@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelByUser() = CancelByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.invalidEmailPassword() = InvalidEmailPassword;
}
```

## Class 3: Modeling the Sign-In Form Events & State
> Create Model for the Sign-In Form Events & State in application layer with the help of bloc.

**define signIn events**
```dart
abstract class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailChanged(String email) = EmailChanged;
  const factory SignInFormEvent.passwordChanged(String password) =
      PasswordChanged;
  const factory SignInFormEvent.registerWithEmailandPassword() =
      RegisterWithEmailandPassword;
  const factory SignInFormEvent.signInWithEmailandPassword() =
      SignInWithEmailandPassword;
  const factory SignInFormEvent.signInWithGoogle() = SignInWithGoogle;
}

```
**define signIn states**
```dart
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required EmailAddress emailAddress,
    required Password password,
    required bool isSubmitting,
    required bool showErrorMessage,
    required Option<Either<AuthFailure, Unit>> authFailureorSuccess,
  }) = _SignInFormState;
  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        isSubmitting: false,
        showErrorMessage: false,
        authFailureorSuccess: none(),
      );
}
```
## Class 5: Firebase Auth Setup & Facade

>cecrate a project in firebase console and implementing the methods infrastructure layer
