part of 'note_watcher_bloc.dart';

@freezed
class NoteWatcherEvent with _$NoteWatcherEvent {
  const factory NoteWatcherEvent.started() = _Started;
  const factory NoteWatcherEvent.unCompletedWatch() = _UnCompletedWatch;
  const factory NoteWatcherEvent.noteWatchAll(
    Either<NoteFailure, KtList<Note>> failureOrNotes,
  ) = _NoteWatchAll;
}
