library com.rick_and_morty.app.auth.router;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import './views/views.dart';
import '../../../cross-modules/typing/typing.dart';

List<GoRoute> dashboardRoutes = <GoRoute>[
  GoRoute(
    path: HomeView.routeName,
    builder: (BuildContext context, GoRouterState state) => const HomeView(),
    routes: <RouteBase>[
      GoRoute(
        path: DetailCharacterView.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            DetailCharacterView(
          character: state.extra! as Character,
        ),
      ),
    ],
  ),
];
