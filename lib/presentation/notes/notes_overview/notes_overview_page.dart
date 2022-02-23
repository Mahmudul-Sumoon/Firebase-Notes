import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/appliction/auth/auth/auth_bloc.dart';
import 'package:notes_app/appliction/auth/note_actor_bloc/note_actor_bloc_bloc.dart';
import 'package:notes_app/appliction/note_watcher/note_watcher_bloc.dart';
import 'package:notes_app/appliction/theme/theme_cubit.dart';
import 'package:notes_app/injection.dart';
import 'package:notes_app/presentation/notes/notes_overview/notes_overview_body.dart';
import 'package:notes_app/presentation/notes/notes_overview/uncomplete_note.dart';
import 'package:notes_app/presentation/routes/router.gr.dart';

class NotesOverviewPage extends StatelessWidget {
  const NotesOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<NoteWatcherBloc>()..add(const NoteWatcherEvent.started()),
        ),
        BlocProvider(
          create: (context) => getIt<NoteActorBlocBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unAuthenticated: (r) =>
                    AutoRouter.of(context).replace(const SignInPageRoute()),
                orElse: () {},
              );
            },
          ),
          BlocListener<NoteActorBlocBloc, NoteActorBlocState>(
            listener: (context, state) {
              state.maybeMap(
                deleteFailure: (state) {
                  FlushbarHelper.createError(
                    duration: const Duration(seconds: 5),
                    message: state.noteFailure.map(
                      unexpected: (_) => 'unexpected error while deleting',
                      permissionError: (_) => 'insuffient permission',
                      unableToUpdate: (_) => 'impossible error',
                    ),
                  ).show(context);
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            leading: IconButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(
                  const AuthEvent.signedOut(),
                );
              },
              icon: const Icon(Icons.exit_to_app),
            ),
            actions: [
              const UncompleteNote(),
              BlocBuilder<ThemeCubit, bool>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      BlocProvider.of<ThemeCubit>(context)
                          .toggleTheme(value: !state);
                    },
                    icon: Icon(state ? Icons.brightness_7 : Icons.add),
                  );
                },
              ),
            ],
          ),
          body: const NotesOverviewBody(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // ignore: avoid_redundant_argument_values
              context.router.push(NoteFormPageRoute(note: null));
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
