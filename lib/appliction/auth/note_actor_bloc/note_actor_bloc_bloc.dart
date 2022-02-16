import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_app/domain/note/note.dart';
import 'package:notes_app/domain/note/note_failure.dart';
import 'package:notes_app/domain/note/note_repository.dart';

part 'note_actor_bloc_event.dart';
part 'note_actor_bloc_state.dart';
part 'note_actor_bloc_bloc.freezed.dart';

@injectable
class NoteActorBlocBloc extends Bloc<NoteActorBlocEvent, NoteActorBlocState> {
  final INoteRepository _noteRepository;
  NoteActorBlocBloc(this._noteRepository)
      : super(const NoteActorBlocState.initial()) {
    on<_Deleted>(_noteDelete);
  }

  Future<void> _noteDelete(
    _Deleted event,
    Emitter<NoteActorBlocState> emit,
  ) async {
    emit(const NoteActorBlocState.actionInProgress());
    final possibleFailure = await _noteRepository.delete(event.note);
    emit(
      possibleFailure.fold(
        NoteActorBlocState.deleteFailure,
        (r) => const NoteActorBlocState.deleteSuccess(),
      ),
    );
  }
}
