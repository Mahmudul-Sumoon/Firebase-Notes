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

## Class 4:  Sign-In Form Logic (Bloc)

>implements events of SignIn form by using bloc.

```dart
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;
  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    {
      on<EmailChanged>(_emailChangedMethod);
      on<PasswordChanged>(_passwordChangeMethod);
      on<RegisterWithEmailandPassword>(_registerWithEmailMethod);
      on<SignInWithEmailandPassword>(_signInWithEmaiMethod);
      on<SignInWithGoogle>(_signInWithGoogleMethod);
    }
  }
  Future<void> _emailChangedMethod(
    EmailChanged event,
    Emitter<SignInFormState> emit,
  ) async {
    emit(
      state.copyWith(
        emailAddress: EmailAddress(event.email),
        authFailureorSuccess: none(),
      ),
    );
  }

  Future<void> _passwordChangeMethod(
    PasswordChanged event,
    Emitter<SignInFormState> emit,
  ) async {
    emit(
      state.copyWith(
        password: Password(event.password),
        authFailureorSuccess: none(),
      ),
    );
  }

  Future<void> _registerWithEmailMethod(
    RegisterWithEmailandPassword event,
    Emitter<SignInFormState> emit,
  ) async {
    Either<AuthFailure, Unit>? successOrFailure;
    final validEmail = state.emailAddress.isValid();
    final validPassword = state.password.isValid();
    if (validEmail && validPassword) {
      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureorSuccess: none(),
        ),
      );
      successOrFailure = await _authFacade.registerWithEmailandPassword(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    } else {}
    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessage: AutovalidateMode.always,
        authFailureorSuccess: optionOf(successOrFailure),
      ),
    );
  }

  Future<void> _signInWithEmaiMethod(
    SignInWithEmailandPassword event,
    Emitter<SignInFormState> emit,
  ) async {
    Either<AuthFailure, Unit>? successOrFailure;
    final validEmail = state.emailAddress.isValid();
    final validPassword = state.password.isValid();
    if (validEmail && validPassword) {
      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureorSuccess: none(),
        ),
      );
      successOrFailure = await _authFacade.signinWithEmailandPassword(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    } else {}
    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessage: AutovalidateMode.always,
        authFailureorSuccess:
            optionOf(successOrFailure), //same as some but with null checking
      ),
    );
  }

  Future<void> _signInWithGoogleMethod(
    SignInWithGoogle event,
    Emitter<SignInFormState> emit,
  ) async {
    emit(
      state.copyWith(
        isSubmitting: true,
        authFailureorSuccess: none(),
      ),
    );
    final successOrFailure = await _authFacade.signInWithGoogle();
    emit(
      state.copyWith(
        isSubmitting: false,
        authFailureorSuccess: some(successOrFailure),
      ),
    );
  }
}

```


## Class 5: Firebase Auth Setup & Facade

>cecrate a project in firebase console and implementing the methods of auth facade in infrastructure layer and handle the auth failure response.

>implement registration
```dart
  Future<Either<AuthFailure, Unit>> registerWithEmailandPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }
```
>implement signIn
```dart
 Future<Either<AuthFailure, Unit>> signinWithEmailandPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return left(const AuthFailure.invalidEmailPassword());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }
```
>implement signIn with google
```dart
 Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelByUser());
      }

      final googleAuthentication = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuthentication.accessToken,
        idToken: googleAuthentication.idToken,
      );
      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((r) => right(unit));
    } on FirebaseAuthException {
      return left(const AuthFailure.serverError());
    }
  }
```

## Class 6: Injectable & very good analyzer
>create injection file for provide application layer to presentation layer.
```dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_app/injection.config.dart';

final GetIt getIt = GetIt.instance;
@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}
```
- where getIt use as Provider to access objects.
- configureInjection(Environment.prod) use in main method as providerScope.
- @injectable use in application layer for bloc.dart file.
- in infrastructure layer
> - @module - dependency
> - @lazySingleton - dependency
> - @LazySingleton(as: IAuthFacade) - repository/facade

## Class 7: Design signIn form

- ui design
> as usual boring design 
- bloc implement in presentation layer
- 1. wrap signIn page with BlocProvider
- 2. pass signInFormBloc by getIt
```dart
BlocProvider(
        create: (context) => getIt<SignInFormBloc>(),
        child: const SignInForm(),
      ),
```
- wrap signInWidgetPage by BlocConsumer which provides two callback function 
- 1. listener -> which listen the state changes at once
- 2. builder -> which provides two properties. (1) _*State Values*_ and _*Events*_

- _**1. State Values**_
Like we use state values inside _Email_ TextField, we need the state of email characters to validate the text.

```dart
 validator: (value) => context
                      .read<SignInFormBloc>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                        (l) => l.maybeMap(
                          invalidEmail: (value) => 'invalid email',
                          orElse: () => 'fsfsa',
                        ),
                        (r) => null,
                      ),
```

- _**2. Events**_
And we use the event to be fired by each onChange() values in the same Email TextField.

```dart
                  onChanged: (value) => BlocProvider.of<SignInFormBloc>(context)
                      .add(SignInFormEvent.emailChanged(value)),
```
## Class 8: Getting the Signed-In User

> create  getSingedInUser in authFacade
```dart
Future<Option<AsUser>> getSingedInUser();
```
- where AsUser is for providing unique id to user for get user from firebase by using uuid
```dart
@freezed
abstract class AsUser with _$AsUser {
  const factory AsUser({
    required UniqueId id,
  }) = _AsUser;
}
```
- now there are two sates of getting singnedInUser
```dart
  const factory AuthState.authenticated() = Authenticated;
  const factory AuthState.unAuthenticated() = UnAuthenticated;
```
- and two events can happen
```dart
  const factory AuthEvent.authCheckRequest() = AuthCheckRequest;
  const factory AuthEvent.signedOut() = SignedOut;
```
- authCheckRequest check the two states for an user 
> we create auth bloc for maintain those states and eventts
```dart
@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;
  AuthBloc(this._authFacade) : super(const AuthState.initial()) {
    on<AuthCheckRequest>((event, emit) async {
      final user = await _authFacade.getSingedInUser();
      emit(
        user.fold(
          () => const AuthState.unAuthenticated(),
          (a) => const AuthState.authenticated(),
        ),
      );
    });

    on<SignedOut>((event, emit) async {
      await _authFacade.signOut();
      emit(const AuthState.unAuthenticated());
    });
  }
}
```
## Class 9: Navigation Based on Auth State

> use auto_route for navigation
```dart
@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SignInPage),
    AutoRoute(page: NotesOverviewPage),
  ],
)
class $AppRouter {}
```
```dart
//decleare variable
final _appRouter = AppRouter();
// where we use blocprovider
.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
//routing
 AutoRouter.of(context).replace(const SignInPageRoute());
// listener navigate when events happen
 AutoRouter.of(context).replace(const NotesOverviewPageRoute());
 getIt<AuthBloc>()..add(const AuthEvent.authCheckRequest()),
```
