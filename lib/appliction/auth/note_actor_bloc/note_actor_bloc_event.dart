part of 'note_actor_bloc_bloc.dart';

@freezed
class NoteActorBlocEvent with _$NoteActorBlocEvent {
  const factory NoteActorBlocEvent.deleted(Note note) = _Deleted;
}
