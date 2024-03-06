import "package:flutter_bloc/flutter_bloc.dart";

import "package:flutter_native_splash/flutter_native_splash.dart";
import "package:go_router/go_router.dart";

import "package:flutter/material.dart";
import "package:inno_hack/Router/auth_listenable.dart";
import "package:inno_hack/provider/user_provider.dart";
import "package:inno_hack/root_scaffold.dart";

import "package:inno_hack/screens/add_catalog.dart";
import "package:inno_hack/screens/home_screen.dart";

import "package:inno_hack/screens/login_screen.dart";
import "package:inno_hack/screens/user_details_screen.dart";
import "package:inno_hack/screens/products_screen.dart";
import "package:inno_hack/screens/second_screen.dart";

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAttendanceKey =
    GlobalKey<NavigatorState>(debugLabel: 'mainnavigation');

final _shellNavigatorRoomsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellRooms');
AuthListen authListen = AuthListen();

final GoRouter router = GoRouter(
  initialLocation: '/',
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
        context.read<UserProvider>().email = authListen.userx!.email;
        context.read<UserProvider>().name = authListen.userx!.name;

        redirectTo = '/home_page';
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
  routes: [
    StatefulShellRoute.indexedStack(
        builder: (context, state, child) {
          print(state.fullPath);
          return RootScaffold(child: child);
        },
        branches: [
          StatefulShellBranch(
              navigatorKey: _shellNavigatorAttendanceKey,
              routes: [
                GoRoute(
                  path: '/home_page',
                  pageBuilder: (context, state) => const MaterialPage(
                      child: HomeScreen(), maintainState: true),
                ),
              ]),
          StatefulShellBranch(navigatorKey: _shellNavigatorRoomsKey, routes: [
            GoRoute(
              path: '/product_screen',
              pageBuilder: (context, state) =>
                  const MaterialPage(child: ProductScreen()),
            ),
          ]),
        ]),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return RootScaffold(child: const LoginScreen());
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'second',
          builder: (BuildContext context, GoRouterState state) {
            return RootScaffold(child: const SecondScreen());
          },
        ),
      ],
    ),
    GoRoute(
      path: '/add_catalog',
      pageBuilder: (context, state) => const MaterialPage(child: AddCatalog()),
    ),
    GoRoute(
      path: '/other_details',
      pageBuilder: (context, state) =>
          const MaterialPage(child: OthersDetailScreen()),
    ),
  ],
);
