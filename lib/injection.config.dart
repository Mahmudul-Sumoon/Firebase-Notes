// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import 'appliction/auth/auth/auth_bloc.dart' as _i16;
import 'appliction/auth/note_actor_bloc/note_actor_bloc_bloc.dart' as _i11;
import 'appliction/auth/note_form_bloc/note_form_bloc_bloc.dart' as _i12;
import 'appliction/auth/sign_in_form/sign_in_form_bloc.dart' as _i14;
import 'appliction/connection_cubit.dart/connection_cubit.dart' as _i17;
import 'appliction/note_watcher/note_watcher_bloc.dart' as _i13;
import 'appliction/theme/theme_cubit.dart' as _i15;
import 'domain/auth/auth_facade.dart' as _i7;
import 'domain/note/note_repository.dart' as _i9;
import 'infrastrructure/auth/firebase_auth_facade.dart' as _i8;
import 'infrastrructure/core/connection_injectable.dart' as _i18;
import 'infrastrructure/core/firebase_injectable_module.dart' as _i19;
import 'infrastrructure/notes/note_repository.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final connectivityInjectableModule = _$ConnectivityInjectableModule();
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.Connectivity>(
      () => connectivityInjectableModule.connection);
  gh.lazySingleton<_i4.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i5.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i6.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<_i7.IAuthFacade>(() =>
      _i8.FirebaseAuthFacade(get<_i4.FirebaseAuth>(), get<_i6.GoogleSignIn>()));
  gh.lazySingleton<_i9.INoteRepository>(
      () => _i10.NoteRepository(get<_i5.FirebaseFirestore>()));
  gh.factory<_i11.NoteActorBlocBloc>(
      () => _i11.NoteActorBlocBloc(get<_i9.INoteRepository>()));
  gh.factory<_i12.NoteFormBlocBloc>(
      () => _i12.NoteFormBlocBloc(get<_i9.INoteRepository>()));
  gh.factory<_i13.NoteWatcherBloc>(
      () => _i13.NoteWatcherBloc(get<_i9.INoteRepository>()));
  gh.factory<_i14.SignInFormBloc>(
      () => _i14.SignInFormBloc(get<_i7.IAuthFacade>()));
  gh.factory<_i15.ThemeCubit>(() => _i15.ThemeCubit());
  gh.factory<_i16.AuthBloc>(() => _i16.AuthBloc(get<_i7.IAuthFacade>()));
  gh.factory<_i17.ConnectionCubit>(
      () => _i17.ConnectionCubit(connectivity: get<_i3.Connectivity>()));
  return get;
}

class _$ConnectivityInjectableModule extends _i18.ConnectivityInjectableModule {
}

class _$FirebaseInjectableModule extends _i19.FirebaseInjectableModule {}
