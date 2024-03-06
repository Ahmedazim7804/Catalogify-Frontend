import "package:flutter_native_splash/flutter_native_splash.dart";
import "package:go_router/go_router.dart";

import "package:flutter/material.dart";
import "package:inno_hack/Router/auth_listenable.dart";
import "package:inno_hack/root_scaffold.dart";

import "package:inno_hack/screens/add_catalog.dart";
import "package:inno_hack/screens/home_screen.dart";

import "package:inno_hack/screens/login_screen.dart";
import "package:inno_hack/screens/user_details_screen.dart";
import "package:inno_hack/screens/products_screen.dart";
import "package:inno_hack/screens/second_screen.dart";

AuthListen authListen = AuthListen();
final GoRouter router = GoRouter(
  initialLocation: '/home_page',
  refreshListenable: authListen,
  redirect: (context, state) {
    print("redirect state.fullpath = ${state.fullPath}");
    String? redirectTo;

    if (authListen.status == AuthenticationStatus.waiting) {
      FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);
      return null;
    }
    print(authListen.status);
    if (state.fullPath == '/') {
      if (authListen.status == AuthenticationStatus.authenticated) {
        redirectTo = '/product_screen';
      } else if (authListen.status == AuthenticationStatus.unauthenticated) {
        redirectTo = '/';
      } else if (authListen.status == AuthenticationStatus.needToFinishSignup) {
        redirectTo = '/other_details';
      }
    }
    print("redirect To => $redirectTo");
    FlutterNativeSplash.remove();
    return redirectTo;
  },
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
    ),
    GoRoute(
      path: '/product_screen',
      builder: (context, state) => const RootScaffold(child: ProductScreen()),
    ),
    GoRoute(
      path: '/other_details',
      builder: (context, state) =>
          const RootScaffold(child: OthersDetailScreen()),
    ),
    GoRoute(path: "/home_page",
    builder: (context, state)=>
    const RootScaffold(child: HomeScreen())
    )
  ],
);
