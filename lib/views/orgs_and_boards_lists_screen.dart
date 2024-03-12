import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trelltech/arbory/services/user_info_service.dart';
import 'package:trelltech/components/CustomAppBar.dart';
import 'package:trelltech/components/business-components/boards_list.dart';
import 'package:trelltech/components/business-components/orgs_list.dart';
import 'package:trelltech/components/custom_bottom_navigation_bar.dart';
import 'package:trelltech/components/custom_button.dart';
import 'package:trelltech/components/custom_title.dart';

class OrgsAndBoardsListScreens extends StatelessWidget{
  // Constructs a [OrgsAndBoardsListScreens]
  const OrgsAndBoardsListScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 16, bottom: 24),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomTitle(text: "Organizations"),
                const OrganizationsList(),
                CustomButton(
                    text: 'create workspace',
                    iconName: Icons.add,
                    onPressed: (){}
                ),
                const CustomTitle(text: 'Boards'),
                const BoardsList(),
                CustomButton(
                    text: 'create board',
                    iconName: Icons.add,
                    onPressed: (){}
                ),
              ]
          )
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
    throw UnimplementedError();
  }
}