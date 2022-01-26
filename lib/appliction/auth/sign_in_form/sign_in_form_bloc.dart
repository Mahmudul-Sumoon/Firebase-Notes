import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_app/domain/auth/auth_facade.dart';
import 'package:notes_app/domain/auth/auth_failure.dart';
import 'package:notes_app/domain/auth/value_objects.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;
  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    //
    on<EmailChanged>((event, emit) async {
      emit(
        state.copyWith(
          emailAddress: EmailAddress(event.email),
          authFailureorSuccess: none(),
        ),
      );
    });
    //
    on<PasswordChanged>((event, emit) async {
      emit(
        state.copyWith(
          password: Password(event.password),
          authFailureorSuccess: none(),
        ),
      );
    });
    //
    on<RegisterWithEmailandPassword>((event, emit) async {
      _performActionAuthFacadeWithEmailAndPassword(
        _authFacade.registerWithEmailandPassword,
        emit,
      );
    });
    //
    on<SignInWithEmailandPassword>((event, emit) async {
      _performActionAuthFacadeWithEmailAndPassword(
        _authFacade.registerWithEmailandPassword,
        emit,
      );
    });
    //
    on<SignInWithGoogle>((event, emit) async {
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
    });
  }

// TODO(checkIn): Need to be tested at presentation layer
  Stream<SignInFormState> _performActionAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      required EmailAddress emailAddress,
      required Password password,
    })
        forwardedcall,
    Emitter emit,
  ) async* {
    Either<AuthFailure, Unit> successOrFailure;
    final validEmail = state.emailAddress.isValid();
    final validPassword = state.password.isValid();
    if (validEmail && validPassword) {
      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureorSuccess: none(),
        ),
      );
    } else {
      successOrFailure = await forwardedcall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
      emit(
        state.copyWith(
          isSubmitting: false,
          showErrorMessage: true,
          authFailureorSuccess: optionOf(successOrFailure),
        ),
      );
    }
  }
}
