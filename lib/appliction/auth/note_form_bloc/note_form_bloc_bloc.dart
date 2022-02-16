import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:notes_app/domain/note/note.dart';
import 'package:notes_app/domain/note/note_failure.dart';
import 'package:notes_app/domain/note/note_repository.dart';
import 'package:notes_app/domain/note/value_object.dart';
import 'package:notes_app/infrastrructure/notes/todo_primitive.dart';

part 'note_form_bloc_event.dart';
part 'note_form_bloc_state.dart';
part 'note_form_bloc_bloc.freezed.dart';

@injectable
class NoteFormBlocBloc extends Bloc<NoteFormBlocEvent, NoteFormBlocState> {
  final INoteRepository _noteRepository;
  NoteFormBlocBloc(this._noteRepository) : super(NoteFormBlocState.initial()) {
    on<_Initialized>(_initializedMethod);
    on<_BodyPressed>(_bodyPressedMethod);
    on<_ColorChanged>(_colorChangedMethod);
    on<_TodosChanged>(_todoChangedMethod);
    on<_Saved>(_savedMethod);
  }
  Future<void> _initializedMethod(
    _Initialized event,
    Emitter<NoteFormBlocState> emit,
  ) async {
    emit(
      event.initialNoteOption.fold(
        () => state, //no change
        (initialNote) => state.copyWith(
          note: initialNote,
          isEditing: true,
        ),
      ),
    );
  }

  Future<void> _bodyPressedMethod(
    _BodyPressed event,
    Emitter<NoteFormBlocState> emit,
  ) async {
    emit(
      state.copyWith(
        note: state.note.copyWith(
          body: NoteBody(event.bodyStr),
        ),
        saveFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _colorChangedMethod(
    _ColorChanged event,
    Emitter<NoteFormBlocState> emit,
  ) async {
    emit(
      state.copyWith(
        note: state.note.copyWith(color: NoteColor(event.color)),
        saveFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _todoChangedMethod(
    _TodosChanged event,
    Emitter<NoteFormBlocState> emit,
  ) async {
    emit(
      state.copyWith(
        note: state.note.copyWith(
          todos: TodoList(event.todos.map((primitive) => primitive.toDomain())),
        ),
        saveFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _savedMethod(
    _Saved event,
    Emitter<NoteFormBlocState> emit,
  ) async {
    Either<NoteFailure, Unit>? failureOrSuccess;

    emit(
      state.copyWith(
        isSaving: true,
        saveFailureOrSuccessOption: none(),
      ),
    );

    if (state.note.failureValue.isNone()) {
      failureOrSuccess = state.isEditing
          ? await _noteRepository.update(state.note)
          : await _noteRepository.create(state.note);
    }
    emit(
      state.copyWith(
        isSaving: false,
        showErrorMessages: AutovalidateMode.always,
        saveFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}
