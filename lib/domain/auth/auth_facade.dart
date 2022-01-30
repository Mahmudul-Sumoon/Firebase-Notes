import 'package:dartz/dartz.dart';
import 'package:notes_app/domain/auth/auth_failure.dart';
import 'package:notes_app/domain/auth/user.dart';
import 'package:notes_app/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  Future<Option<AsUser>> getSingedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailandPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signinWithEmailandPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
