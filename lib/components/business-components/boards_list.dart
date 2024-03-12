import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../arbory/services/boards_services.dart';
import '../custom_card.dart';

class BoardsList extends StatelessWidget {
  const BoardsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Boards>(
      builder: (context, boards, child) {
        return ListView.builder(
          itemCount: boards.boards.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return CustomCard(
              iconData: Icons.dataset_outlined,
              title: boards.boards[index].name,
              subtitle: boards.boards[index].desc == '' ? 'No description' : boards.boards[index].desc,
              onTap: () => {},
            );
          },
        );
      },
    );
  }
}