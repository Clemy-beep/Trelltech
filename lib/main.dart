// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trelltech/arbory/organization_service.dart';

import 'arbory/_router.dart';
import 'arbory/auth_service.dart';
import 'arbory/user_info_service.dart';
import 'arbory/boards_services.dart';

/// The main entry point for the application.
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProxyProvider<Auth, TokenMember>(
          create: (context) => TokenMember(context.read<Auth>()),
          update: (context, auth, userInfo) {
            userInfo = userInfo ?? TokenMember(auth);
            userInfo.authUpdate(auth);
            return userInfo;
          },
        ),
        ChangeNotifierProxyProvider<TokenMember, Boards>(
          create: (context) =>
              Boards(context.read<TokenMember>(), context.read<Auth>()),
          update: (context, tokenMember, boards) {
            boards = boards ?? Boards(tokenMember, context.read<Auth>());
            boards.update();
            return boards;
          },
        ),
        ChangeNotifierProxyProvider3<Auth, TokenMember, Boards, Organizations>(
          create: (context) => Organizations(context.read<Auth>(),
              context.read<TokenMember>(), context.read<Boards>()),
          update: (context, auth, tokenMember, boards, organizations) {
            organizations =
                organizations ?? Organizations(auth, tokenMember, boards);
            organizations.update();
            return organizations;
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
