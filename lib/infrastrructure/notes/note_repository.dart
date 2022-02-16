import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:notes_app/domain/note/note.dart';
import 'package:notes_app/domain/note/note_failure.dart';
import 'package:notes_app/domain/note/note_repository.dart';
import 'package:notes_app/infrastrructure/core/firestore_helpers.dart';
import 'package:notes_app/infrastrructure/notes/notes_dto.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  final FirebaseFirestore _firestore;
  NoteRepository(this._firestore);
  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchAll() async* {
    //print("gjhj");
    final user = await _firestore.userDocument();
    yield* user.noteCollection
        .orderBy(
          'serverTimeStamp',
          descending: true,
        )
        .snapshots()
        .map(
          (notes) => right<NoteFailure, KtList<Note>>(
            notes.docs
                .map(
                  (e) => NotesDto.fromFirestore(e).toDomain(),
                )
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((e, stackTrace) {
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const NoteFailure.permissionError());
      } else {
        return left(const NoteFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted() async* {
    final user = await _firestore.userDocument();
    yield* user.noteCollection
        .orderBy(
          'serverTimeStamp',
          descending: true,
        )
        .snapshots()
        .map(
          (event) =>
              event.docs.map((e) => NotesDto.fromFirestore(e).toDomain()),
        )
        .map(
          (notes) => right<NoteFailure, KtList<Note>>(
            notes
                .where(
                  (note) => note.todos
                      .getOrCrash()
                      .any((todoItem) => !todoItem.isDone),
                )
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((e, stackTrace) {
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const NoteFailure.permissionError());
      } else {
        return left(const NoteFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<NoteFailure, Unit>> create(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final notesDto = NotesDto.fromDomain(note);

      await userDoc.noteCollection.doc(notesDto.id).set(notesDto.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const NoteFailure.permissionError());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteId = note.id.getOrCrash();

      await userDoc.noteCollection.doc(noteId).delete();
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const NoteFailure.permissionError());
      } else if (e.message!.contains('not-found')) {
        return left(const NoteFailure.unableToUpdate());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteDto = NotesDto.fromDomain(note);

      //print(noteDto.toString());
      //  print(note.id.getOrCrash());

      await userDoc.noteCollection.doc(noteDto.id).update(noteDto.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const NoteFailure.unableToUpdate());
      } else if (e.message!.contains('not-found')) {
        return left(const NoteFailure.permissionError());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }
}
