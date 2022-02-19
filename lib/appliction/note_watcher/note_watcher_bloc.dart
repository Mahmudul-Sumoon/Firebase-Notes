import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:notes_app/domain/note/note.dart';
import 'package:notes_app/domain/note/note_failure.dart';
import 'package:notes_app/domain/note/note_repository.dart';

part 'note_watcher_event.dart';
part 'note_watcher_state.dart';
part 'note_watcher_bloc.freezed.dart';

@injectable
class NoteWatcherBloc extends Bloc<NoteWatcherEvent, NoteWatcherState> {
  final INoteRepository _noteRepository;
  StreamSubscription<Either<NoteFailure, KtList<Note>>>? _noteStream;
  NoteWatcherBloc(this._noteRepository)
      : super(const NoteWatcherState.initial()) {
    on<_Started>((event, emit) async {
      await _noteStream?.cancel();
      emit(const NoteWatcherState.loading());
      _noteStream = _noteRepository.watchAll().listen((failureOrNotes) {
        return add(NoteWatcherEvent.noteWatchAll(failureOrNotes));
      });
    });
    on<_NoteWatchAll>((event, emit) async {
      emit(
        event.failureOrNotes.fold(
          NoteWatcherState.failure,
          NoteWatcherState.success,
        ),
      );
    });
    on<_UnCompletedWatch>((event, emit) async {
      await _noteStream?.cancel();
      emit(const NoteWatcherState.loading());

      _noteStream = _noteRepository.watchUncompleted().listen(
            (failureOrNotes) =>
                add(NoteWatcherEvent.noteWatchAll(failureOrNotes)),
          );
    });
  }
}
