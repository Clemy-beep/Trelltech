import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trelltech/arbory/services/auth_service.dart';
import 'package:trelltech/arbory/services/user_info_service.dart';
import 'package:trelltech/components/custom_bottom_navigation_bar.dart';
import 'package:trelltech/components/checkbox.dart';
import 'package:trelltech/components/custom_card.dart';
import 'package:trelltech/components/custom_list_tile.dart';
import 'package:trelltech/components/custom_expansion_tile.dart';
import 'package:trelltech/components/delete_text_button.dart';

class OrgsAndBoardsListScreens extends StatelessWidget {
  // Constructs a [OrgsAndBoardsListScreens]
  const OrgsAndBoardsListScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<TokenMember>(
          builder: (context, tokenMember, child) {
            return Container(
                alignment: Alignment.centerRight,
                child: Text(
                  'welcome ${tokenMember.member?.fullName ?? 'no user'} !',
                  textAlign: TextAlign.end,
                  textWidthBasis: TextWidthBasis.longestLine,
                  style: const TextStyle(
                    fontFamily: 'LexendExa',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Orgs and Boards List Screens'),
              CustomCard(
                title: 'workspace',
                subtitle: 'subtitle',
                date: 'date',
              ),
              CustomListTile(cardTitle: 'Hey', memberAvatar: ''),
              CustomExpansionTile(
                  title: 'workspaces',
                  subtitle: 'fo',
                  children: [
                    CustomListTile(cardTitle: '"qff', memberAvatar: '')
                  ]),
              CustomIconButton(onPressed: () => {print('delete')}),
              CustomIconButton(onPressed: () => {print('edit')}),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
    throw UnimplementedError();
  }
}
