library com.rick_and_morty.app.auth.router;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import './views/views.dart';

List<GoRoute> authRoutes = <GoRoute>[
  GoRoute(
    path: LoginView.routeName,
    builder: (BuildContext context, GoRouterState state) => const LoginView(),
  ),
];
