import 'package:auto_route/auto_route.dart';
import 'package:notes_app/presentation/core/connection_disable.dart';
import 'package:notes_app/presentation/notes/note_form/note_form_page.dart';
import 'package:notes_app/presentation/notes/notes_overview/notes_overview_page.dart';
import 'package:notes_app/presentation/sign_in/sign_in_page.dart';
import 'package:notes_app/presentation/splash_screen/connection_screen.dart';
import 'package:notes_app/presentation/splash_screen/splash_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: ConnectionPage, initial: true),
    AutoRoute(page: ConnectionDisablePage),
    AutoRoute(page: SplashPage),
    AutoRoute(page: SignInPage),
    AutoRoute(page: NotesOverviewPage),
    AutoRoute(page: NoteFormPage, fullscreenDialog: true),
  ],
)
class $AppRouter {}
