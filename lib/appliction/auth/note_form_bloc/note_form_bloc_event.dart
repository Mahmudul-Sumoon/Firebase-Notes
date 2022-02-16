part of 'note_form_bloc_bloc.dart';

@freezed
class NoteFormBlocEvent with _$NoteFormBlocEvent {
  const factory NoteFormBlocEvent.initialized(Option<Note> initialNoteOption) =
      _Initialized;
  const factory NoteFormBlocEvent.bodyPressed(String bodyStr) = _BodyPressed;
  const factory NoteFormBlocEvent.colorChanged(Color color) = _ColorChanged;
  const factory NoteFormBlocEvent.todosChanged(
    KtList<TodoItemPrimitive> todos,
  ) = _TodosChanged;
  const factory NoteFormBlocEvent.saved() = _Saved;
}
