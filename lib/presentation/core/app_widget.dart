import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/appliction/auth/auth/auth_bloc.dart';
import 'package:notes_app/appliction/connection_cubit.dart/connection_cubit.dart';
import 'package:notes_app/appliction/theme/theme_cubit.dart';
import 'package:notes_app/injection.dart';
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
        BlocProvider(
          create: (context) => getIt<ThemeCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ConnectionCubit>(),
        ),
      ],
      //create: (context) => SubjectBloc(),
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            title: 'Notes',
            theme: ThemeData(
              colorSchemeSeed: Colors.green.shade800,
              brightness: state ? Brightness.light : Brightness.dark,
              useMaterial3: true,
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            // theme: ThemeData.light().copyWith(
            //   floatingActionButtonTheme: FloatingActionButtonThemeData(
            //     backgroundColor: Colors.blue.shade900,
            //   ),
            //   primaryColor: Colors.green[800],
            //   inputDecorationTheme: InputDecorationTheme(
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //   ),
            //   colorScheme: ColorScheme.fromSwatch()
            //       .copyWith(secondary: Colors.blueAccent),
            // ),
          );
        },
      ),
    );
  }
}
