import 'package:flutter/material.dart';
import 'package:notes_app/domain/note/note.dart';

class ErrorNoteBody extends StatelessWidget {
  final Note note;
  const ErrorNoteBody({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).errorColor,
      child: Column(
        children: [
          Text(
            'Invalid Note',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyText2
                ?.copyWith(fontSize: 18),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Details',
            style: Theme.of(context).primaryTextTheme.bodyText2,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            note.failureValue.fold(() => '', (a) => a.toString()),
            style: Theme.of(context).primaryTextTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
