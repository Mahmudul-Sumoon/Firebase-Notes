part of 'note_form_bloc_bloc.dart';

@freezed
class NoteFormBlocState with _$NoteFormBlocState {
  const factory NoteFormBlocState({
    required Note note,
    required AutovalidateMode showErrorMessages,
    required bool isEditing,
    required bool isSaving,
    required Option<Either<NoteFailure, Unit>> saveFailureOrSuccessOption,
  }) = _NoteFormBlocState;
  factory NoteFormBlocState.initial() => NoteFormBlocState(
        note: Note.empty(),
        showErrorMessages: AutovalidateMode.disabled,
        isEditing: false,
        isSaving: false,
        saveFailureOrSuccessOption: none(),
      );
}
