import 'package:flutter/material.dart' hide Colors;

import './modules/auth/ui/views/views.dart';
import '../cross-modules/ui-shared/ui_shared.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black[900],
          appBarTheme: AppBarTheme(
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
        home: const LoginView(),
        // home: const HomeView(title: 'Flutter Demo Home Page'),
      );
}
