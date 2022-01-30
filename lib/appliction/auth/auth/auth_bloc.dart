import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_app/domain/auth/auth_facade.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

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
