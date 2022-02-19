import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/appliction/auth/note_form_bloc/note_form_bloc_bloc.dart';
import 'package:notes_app/domain/note/note.dart';
import 'package:notes_app/infrastrructure/notes/todo_primitive.dart';
import 'package:notes_app/injection.dart';
import 'package:notes_app/presentation/notes/note_form/add_todo.dart';
import 'package:notes_app/presentation/notes/note_form/body_color.dart';
import 'package:notes_app/presentation/notes/note_form/note_body.dart';
import 'package:notes_app/presentation/notes/note_form/todo_list_widget.dart';
import 'package:notes_app/presentation/routes/router.gr.dart';
import 'package:provider/provider.dart';

class NoteFormPage extends StatelessWidget {
  final Note? note;
  const NoteFormPage({Key? key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NoteFormBlocBloc>()
        ..add(NoteFormBlocEvent.initialized(optionOf(note))),
      child: BlocConsumer<NoteFormBlocBloc, NoteFormBlocState>(
        listenWhen: (p, c) =>
            p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
        listener: (context, state) {
          state.saveFailureOrSuccessOption.fold(() {}, (a) {
            a.fold((l) {
              FlushbarHelper.createError(
                message: l.map(
                  unexpected: (_) => 'unexpected Error',
                  permissionError: (_) => 'Permission Error',
                  unableToUpdate: (_) => 'Unable to Update Error',
                ),
              ).show(context);
            }, (r) {
              context.router.popUntil(
                (route) => route.settings.name == NotesOverviewPageRoute.name,
              );
            });
          });
        },
        buildWhen: (p, c) => p.isSaving != c.isSaving,
        builder: (context, state) {
          return Stack(
            children: <Widget>[
              const NoteFormPageScaffold(),
              SavingOverLay(
                isSaving: state.isSaving,
              ),
            ],
          );
        },
      ),
    );
  }
}

class NoteFormPageScaffold extends StatelessWidget {
  const NoteFormPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NoteFormBlocBloc, NoteFormBlocState>(
          buildWhen: (p, c) => p.isEditing != c.isEditing,
          builder: (context, state) {
            return Text(state.isEditing ? 'Edit A Note' : 'Create A Note');
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<NoteFormBlocBloc>(context)
                  .add(const NoteFormBlocEvent.saved());
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: BlocBuilder<NoteFormBlocBloc, NoteFormBlocState>(
        buildWhen: (p, c) => p.showErrorMessages != c.showErrorMessages,
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (_) => FormTodo(),
            child: Form(
              autovalidateMode: state.showErrorMessages,
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    BodyField(),
                    ColorBody(),
                    TodoList(),
                    AddTodo(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SavingOverLay extends StatelessWidget {
  final bool isSaving;
  const SavingOverLay({
    Key? key,
    required this.isSaving,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        color: isSaving ? Colors.black.withOpacity(.8) : Colors.transparent,
        child: Visibility(
          visible: isSaving,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Center(
                child: CircularProgressIndicator(),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Saving',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
