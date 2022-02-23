import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:notes_app/appliction/auth/note_actor_bloc/note_actor_bloc_bloc.dart';
import 'package:notes_app/domain/note/note.dart';
import 'package:notes_app/presentation/notes/notes_overview/todo_display.dart';
import 'package:notes_app/presentation/routes/router.gr.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color.getOrCrash(),
      child: InkWell(
        onTap: () {
          context.router.push(NoteFormPageRoute(note: note));
        },
        onLongPress: () {
          //final noteActorBlocBloc = ;
          _deleteDialog(context, BlocProvider.of<NoteActorBlocBloc>(context));
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.body.getOrCrash(),
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              if (note.todos.length > 0) ...[
                const SizedBox(
                  height: 4,
                ),
                Wrap(
                  spacing: 8,
                  children: [
                    ...note.todos
                        .getOrCrash()
                        .map(
                          (todo) => NoteDisplay(
                            todo: todo,
                          ),
                        )
                        .iter,
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _deleteDialog(
    BuildContext context,
    NoteActorBlocBloc noteActorBloc,
  ) {
    showDialog<Widget>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selected Note : '),
          content: Text(
            note.body.getOrCrash(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('CANCEL'),
            ),
            ElevatedButton(
              onPressed: () {
                noteActorBloc.add(NoteActorBlocEvent.deleted(note));
                Navigator.pop(context);
              },
              child: const Text('DELETE'),
            ),
          ],
        );
      },
    );
  }
}
