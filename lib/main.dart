import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_app/injection.dart';
import 'package:notes_app/presentation/core/app_widget.dart';
import 'package:path_provider/path_provider.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      // options: const FirebaseOptions(
      //   apiKey: "AIzaSyB15ssT4Bju8NgHHvsgN_csA7c7gGujwho",
      //   authDomain: "notes-app-8ab82.firebaseapp.com",
      //   projectId: "notes-app-8ab82",
      //   storageBucket: "notes-app-8ab82.appspot.com",
      //   messagingSenderId: "575672738868",
      //   appId: "1:575672738868:web:f72474d5865dc617755661",
      // ),
      );
  configureInjection(Environment.prod);
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(AppWidget()),
    storage: storage,
  );
}
