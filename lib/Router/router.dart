import "package:go_router/go_router.dart";

import "package:flutter/material.dart";
import "package:inno_hack/root_scaffold.dart";

import "package:inno_hack/screens/add_catalog.dart";


import "package:inno_hack/screens/login_screen.dart";

import "package:inno_hack/screens/second_screen.dart";

final GoRouter router = GoRouter(
  initialLocation: '/add_catalog',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const RootScaffold(child: LoginScreen());
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'second',
          builder: (BuildContext context, GoRouterState state) {
            return const RootScaffold(child: SecondScreen());
          },
        ),
      ],
    ),
    GoRoute(
      path: '/add_catalog',
      builder: (context, state) => const AddCatalog(),
    )
  ],
);
