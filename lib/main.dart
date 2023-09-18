import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cross-modules/core/services/services.dart';
import 'firebase_options.dart';
import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configCore();
  await StorageService.instance.init();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

Future<void> configCore() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuthService.instance.init();
}
