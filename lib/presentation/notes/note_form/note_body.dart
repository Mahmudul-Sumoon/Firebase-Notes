import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes_app/appliction/auth/note_form_bloc/note_form_bloc_bloc.dart';
import 'package:notes_app/domain/note/value_object.dart';

class BodyField extends HookWidget {
  const BodyField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();
    return BlocConsumer<NoteFormBlocBloc, NoteFormBlocState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        textEditingController.text = state.note.body.getOrCrash();
      },
      buildWhen: (p, c) =>
          p.isEditing != c.isEditing || p.note.color != c.note.color,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: textEditingController,
            // ignore: require_trailing_commas
            decoration: InputDecoration(
              fillColor: BlocProvider.of<NoteFormBlocBloc>(context)
                  .state
                  .note
                  .color
                  .value
                  .fold((l) {}, (r) => r),
              filled: true,
              labelText: 'Note',
              //counterText: '',
            ),
            maxLength: NoteBody.max,
            maxLines: null,
            minLines: 5,
            onChanged: (value) =>
                BlocProvider.of<NoteFormBlocBloc>(context).add(
              NoteFormBlocEvent.bodyPressed(value),
            ),
            validator: (_) => BlocProvider.of<NoteFormBlocBloc>(context)
                .state
                .note
                .body
                .value
                .fold(
                  (l) => l.maybeMap(
                    empty: (value) => 'Cannot be Empty',
                    exceedingLength: (value) =>
                        'Excedding Length, max: ${value.max}',
                    orElse: () {},
                  ),
                  (r) {},
                ),
          ),
        );
      },
    );
  }
}
