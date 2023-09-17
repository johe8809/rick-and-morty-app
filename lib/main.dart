import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/firebase_options.dart';
import 'package:rick_and_morty_app/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configCore();
  runApp(const MyApp());
}

Future<void> configCore() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAuthService.instance.init();
}
