import "package:go_router/go_router.dart";

import "package:flutter/material.dart";
import "package:inno_hack/root_scaffold.dart";

import "package:inno_hack/screens/add_catalog.dart";


import "package:inno_hack/screens/login_screen.dart";
import "package:inno_hack/screens/widgets/product_item.dart";
import "package:inno_hack/screens/products_screen.dart";
import "package:inno_hack/screens/second_screen.dart";

final GoRouter router = GoRouter(
  initialLocation: '/second',
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
    )  ,
    GoRoute(
      path: '/product_screen',
      builder: (context, state) => const RootScaffold(child: ProductScreen()),
    )
  ],
);
