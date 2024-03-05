// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'arbory/_router.dart';
import 'arbory/auth_service.dart';
import 'arbory/user_info_service.dart';

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
