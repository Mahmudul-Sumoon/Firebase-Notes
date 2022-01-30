import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/appliction/auth/auth/auth_bloc.dart';
import 'package:notes_app/injection.dart';
import 'package:notes_app/presentation/sign_in/sign_in_page.dart';

import 'package:notes_app/presentation/routes/router.gr.dart';

class AppWidget extends StatelessWidget {
  final _appRouter = AppRouter();
  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequest()),
        ),
      ],
      //create: (context) => SubjectBloc(),
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'Notes App',
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.green[800],
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
        ),
      ),
    );
  }
}
