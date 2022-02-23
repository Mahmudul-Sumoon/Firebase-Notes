import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/appliction/connection_cubit.dart/connection_cubit.dart';
import 'package:notes_app/presentation/routes/router.gr.dart';

class ConnectionDisablePage extends StatelessWidget {
  const ConnectionDisablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectionCubit, bool>(
      listener: (context, state) {
        state
            ? context.router.replace(const SplashPageRoute())
            : context.router.replace(const ConnectionDisablePageRoute());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
        ),
        body: const Center(child: Text('No Internet 😎')),
      ),
    );
  }
}
