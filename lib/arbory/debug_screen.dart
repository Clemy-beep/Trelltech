import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'auth_service.dart';
import 'boards_services.dart';
import 'organization_service.dart';
import 'user_info_service.dart';

/// The home screen
class DebugScreen extends StatelessWidget {
  /// Constructs a [DebugScreen]
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<Auth>().signUp().then((webWiew) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Scaffold(
                              appBar: AppBar(
                                  title: const Text('TrailTech Sign-up')),
                              body: WebViewWidget(controller: webWiew))));
                });
              },
              child: const Text('sign-up'),
            ),
            //text to show apitoken
            Consumer<Auth>(
              builder: (context, auth, child) {
                return Text(auth.apiToken ?? 'no token');
              },
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  spacing: 16,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    // user info
                    Consumer<TokenMember>(
                      builder: (context, tokenMember, child) {
                        return Column(
                          children: [
                            Text(tokenMember.member?.fullName ?? 'no user'),
                            for (var board
                                in tokenMember.member?.idBoards ?? [])
                              Text(board),
                          ],
                        );
                      },
                    ),
                    //boards
                    Consumer<Boards>(
                      builder: (context, boards, child) {
                        return Column(
                          children: [
                            Text('${boards.boards.length} boards'),
                            for (var board in boards.boards) Text(board.name),
                          ],
                        );
                      },
                    ),
                    Consumer<Organizations>(
                      builder: (context, organizations, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${organizations.organizations.length} organizations'),
                            //organizations name and boards name
                            for (var organization
                                in organizations.organizations)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(organization.name),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (var board in organization.boards)
                                          Text(board.name),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
