import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/appliction/auth/auth/auth_bloc.dart';
import 'package:notes_app/appliction/auth/note_actor_bloc/note_actor_bloc_bloc.dart';
import 'package:notes_app/appliction/note_watcher/note_watcher_bloc.dart';
import 'package:notes_app/injection.dart';
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
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.check_box_outline_blank),
              ),
            ],
          ),
          body: Container(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
