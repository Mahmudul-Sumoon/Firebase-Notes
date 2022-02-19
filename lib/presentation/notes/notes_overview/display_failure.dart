import 'package:flutter/material.dart';
import 'package:notes_app/domain/note/note_failure.dart';

class NoteFailure1 extends StatelessWidget {
  final NoteFailure failure;
  const NoteFailure1({Key? key, required this.failure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '🐱',
              style: TextStyle(fontSize: 100),
            ),
            const SizedBox(height: 4),
            Text(
              failure.maybeMap(
                permissionError: (_) => 'Insufficient Permission',
                orElse: () => 'Unexpected Error Contact Support',
              ),
              style: const TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
