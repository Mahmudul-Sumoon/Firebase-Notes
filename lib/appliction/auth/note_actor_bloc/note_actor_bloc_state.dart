part of 'note_actor_bloc_bloc.dart';

@freezed
class NoteActorBlocState with _$NoteActorBlocState {
  const factory NoteActorBlocState.initial() = _Initial;
  const factory NoteActorBlocState.actionInProgress() = _ActionInProgress;
  const factory NoteActorBlocState.deleteFailure(NoteFailure noteFailure) =
      _DeleteFailure;
  const factory NoteActorBlocState.deleteSuccess() = _DeleteSuccess;
}
