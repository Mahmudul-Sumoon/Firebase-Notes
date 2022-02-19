import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/appliction/note_watcher/note_watcher_bloc.dart';
import 'package:notes_app/presentation/notes/notes_overview/display_failure.dart';
import 'package:notes_app/presentation/notes/notes_overview/error_note_body.dart';
import 'package:notes_app/presentation/notes/notes_overview/note_card_ui.dart';

class NotesOverviewBody extends StatelessWidget {
  const NotesOverviewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          success: (state) {
            return ListView.builder(
              itemCount: state.notes.size,
              itemBuilder: (context, index) {
                final note = state.notes[index];
                if (note.failureValue.isSome()) {
                  return ErrorNoteBody(note: note);
                } else {
                  return NoteCard(
                    note: note,
                  );
                }
              },
            );
          },
          failure: (state) {
            return NoteFailure1(failure: state.failure);
          },
        );
      },
    );
  }
}
