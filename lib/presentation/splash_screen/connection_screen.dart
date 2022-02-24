import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/appliction/connection_cubit.dart/connection_cubit.dart';
import 'package:notes_app/presentation/core/connection_disable.dart';
import 'package:notes_app/presentation/routes/router.gr.dart';

class ConnectionPage extends StatelessWidget {
  const ConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectionCubit, bool>(
      listener: (context, state) {
        state
            ? context.router.replace(const SplashPageRoute())
            : const Text('sdbasgjdasgdas');
      },
      builder: (context, state) => const Scaffold(
        body: Center(
          child: ConnectionDisablePage(),
        ),
      ),
    );
  }
}
