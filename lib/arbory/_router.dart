import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trelltech/views/board_screen.dart';
import 'package:trelltech/views/create_board_screen.dart';
import 'package:trelltech/views/create_workspace_screen.dart';
import 'package:trelltech/views/edit_organization_screen.dart';
import 'package:trelltech/views/organization_screen.dart';
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
        GoRoute(
          path: 'create-workspace',
          builder: (BuildContext context, GoRouterState state) {
            return const CreateWorkspaceScreen();
          },
        ),
        GoRoute(
          name: 'org',
          path: 'org/:orgId',
          builder: (BuildContext context, GoRouterState state) {
            return OrganizationScreen(orgId: state.pathParameters['orgId']);
          },
        ),
        GoRoute(
          path: 'create-board',
          builder: (BuildContext context, GoRouterState state) {
            return const CreateBoardScreen();
          },
        ),
        GoRoute(
          path: 'board/:boardId',
          builder: (BuildContext context, GoRouterState state) {
            return BoardScreen(boardId: state.pathParameters['boardId']);
          },
        ),
        GoRoute(
          path: 'edit-organization/:orgId',
          builder: (BuildContext context, GoRouterState state) {
            return EditOrganizationScreen(orgId: state.pathParameters['orgId']);
          },
        )
      ],
    ),
  ],
);
