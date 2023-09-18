import 'package:flutter/material.dart' hide Colors;

import '../cross-modules/ui-shared/ui_shared.dart';
import 'navigator/navigator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Rick and Morty',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black[900],
          appBarTheme: AppBarTheme(
            // TODO(Yonnathan): enhance this theme
            backgroundColor: Colors.black[600],
            elevation: 0,
          ),
          textTheme: TextTheme(
            displayLarge: DisplayTextStyle.display3.copyWith(
              color: Colors.white[0],
            ),
            displayMedium: DisplayTextStyle.display2.copyWith(
              color: Colors.white[0],
            ),
            displaySmall: DisplayTextStyle.display1.copyWith(
              color: Colors.white[0],
            ),
            bodyLarge: BodyTextStyle.body1.copyWith(
              color: Colors.white[0],
            ),
            bodyMedium: BodyTextStyle.body2.copyWith(
              color: Colors.white[0],
            ),
          ),
          useMaterial3: true,
        ),
        routerConfig: router,
      );
}
