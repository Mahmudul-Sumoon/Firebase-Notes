import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_app/injection.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: const Scaffold(),
    );
  }
}
