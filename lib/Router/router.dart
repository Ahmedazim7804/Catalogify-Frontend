import "package:go_router/go_router.dart";

import "package:flutter/material.dart";
import "package:inno_hack/root_scaffold.dart";
import "package:inno_hack/screens/add_catalog.dart";
import "package:inno_hack/screens/home_page.dart";
import "package:inno_hack/screens/second_screen.dart";

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const RootScaffold(child: HomeScreen());
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
