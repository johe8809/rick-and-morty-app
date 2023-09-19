import 'package:flutter/material.dart' hide Colors;

import '../cross-modules/navigator/navigator.dart';
import '../cross-modules/ui-shared/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Rick and Morty',
        theme: UITheme.main,
        routerConfig: router,
      );
}
