import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/appliction/auth/note_form_bloc/note_form_bloc_bloc.dart';
import 'package:notes_app/domain/note/value_object.dart';

class ColorBody extends StatelessWidget {
  const ColorBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormBlocBloc, NoteFormBlocState>(
      builder: (context, state) {
        return SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final itemColor = NoteColor.predefinedColors[index];
                return RawMaterialButton(
                  elevation: 6,
                  onPressed: () {
                    BlocProvider.of<NoteFormBlocBloc>(context).add(
                      NoteFormBlocEvent.colorChanged(itemColor),
                    );
                  },
                  constraints: const BoxConstraints.tightFor(
                    height: 60,
                    width: 60,
                  ),
                  shape: CircleBorder(
                    side: state.note.color.value.fold(
                      (l) => BorderSide.none,
                      (r) => r == itemColor
                          ? const BorderSide(width: 1.5)
                          : BorderSide.none,
                    ),
                  ),
                  fillColor: itemColor,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 12,
                );
              },
              itemCount: NoteColor.predefinedColors.length,
            ),
          ),
        );
      },
    );
  }
}
