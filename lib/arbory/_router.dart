import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trelltech/views/orgs_and_boards_lists_screen.dart';

import 'debug_screen.dart';
import 'details_screen.dart';
import '../views/home_screen.dart';

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
        GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return const OrgsAndBoardsListScreens();
              },
        ),
      ],
    ),
  ],
);
