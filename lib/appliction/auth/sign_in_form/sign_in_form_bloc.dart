import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
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
        authFailureorSuccess: optionOf(successOrFailure),
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
