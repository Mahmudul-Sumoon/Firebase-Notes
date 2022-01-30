import 'package:auto_route/auto_route.dart';
import 'package:notes_app/presentation/core/app_widget.dart';
import 'package:notes_app/presentation/notes/notes_overview/notes_overview_page.dart';
import 'package:notes_app/presentation/sign_in/sign_in_page.dart';
import 'package:notes_app/presentation/splash_screen/splash_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SignInPage),
    AutoRoute(page: NotesOverviewPage),
  ],
)
class $AppRouter {}
