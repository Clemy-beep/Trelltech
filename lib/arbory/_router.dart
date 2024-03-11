import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'debug_screen.dart';
import 'details_screen.dart';
import 'home_screen.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'debug',
          builder: (BuildContext context, GoRouterState state) {
            return const DebugScreen();
          },
        ),
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
      ],
    ),
  ],
);
