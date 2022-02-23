// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../domain/note/note.dart' as _i9;
import '../core/connection_disable.dart' as _i2;
import '../notes/note_form/note_form_page.dart' as _i6;
import '../notes/notes_overview/notes_overview_page.dart' as _i5;
import '../sign_in/sign_in_page.dart' as _i4;
import '../splash_screen/connection_screen.dart' as _i1;
import '../splash_screen/splash_screen.dart' as _i3;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    ConnectionPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ConnectionPage());
    },
    ConnectionDisablePageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ConnectionDisablePage());
    },
    SplashPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SplashPage());
    },
    SignInPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SignInPage());
    },
    NotesOverviewPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.NotesOverviewPage());
    },
    NoteFormPageRoute.name: (routeData) {
      final args = routeData.argsAs<NoteFormPageRouteArgs>(
          orElse: () => const NoteFormPageRouteArgs());
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.NoteFormPage(key: args.key, note: args.note),
          fullscreenDialog: true);
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(ConnectionPageRoute.name, path: '/'),
        _i7.RouteConfig(ConnectionDisablePageRoute.name,
            path: '/connection-disable-page'),
        _i7.RouteConfig(SplashPageRoute.name, path: '/splash-page'),
        _i7.RouteConfig(SignInPageRoute.name, path: '/sign-in-page'),
        _i7.RouteConfig(NotesOverviewPageRoute.name,
            path: '/notes-overview-page'),
        _i7.RouteConfig(NoteFormPageRoute.name, path: '/note-form-page')
      ];
}

/// generated route for
/// [_i1.ConnectionPage]
class ConnectionPageRoute extends _i7.PageRouteInfo<void> {
  const ConnectionPageRoute() : super(ConnectionPageRoute.name, path: '/');

  static const String name = 'ConnectionPageRoute';
}

/// generated route for
/// [_i2.ConnectionDisablePage]
class ConnectionDisablePageRoute extends _i7.PageRouteInfo<void> {
  const ConnectionDisablePageRoute()
      : super(ConnectionDisablePageRoute.name,
            path: '/connection-disable-page');

  static const String name = 'ConnectionDisablePageRoute';
}

/// generated route for
/// [_i3.SplashPage]
class SplashPageRoute extends _i7.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/splash-page');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i4.SignInPage]
class SignInPageRoute extends _i7.PageRouteInfo<void> {
  const SignInPageRoute() : super(SignInPageRoute.name, path: '/sign-in-page');

  static const String name = 'SignInPageRoute';
}

/// generated route for
/// [_i5.NotesOverviewPage]
class NotesOverviewPageRoute extends _i7.PageRouteInfo<void> {
  const NotesOverviewPageRoute()
      : super(NotesOverviewPageRoute.name, path: '/notes-overview-page');

  static const String name = 'NotesOverviewPageRoute';
}

/// generated route for
/// [_i6.NoteFormPage]
class NoteFormPageRoute extends _i7.PageRouteInfo<NoteFormPageRouteArgs> {
  NoteFormPageRoute({_i8.Key? key, _i9.Note? note})
      : super(NoteFormPageRoute.name,
            path: '/note-form-page',
            args: NoteFormPageRouteArgs(key: key, note: note));

  static const String name = 'NoteFormPageRoute';
}

class NoteFormPageRouteArgs {
  const NoteFormPageRouteArgs({this.key, this.note});

  final _i8.Key? key;

  final _i9.Note? note;

  @override
  String toString() {
    return 'NoteFormPageRouteArgs{key: $key, note: $note}';
  }
}
