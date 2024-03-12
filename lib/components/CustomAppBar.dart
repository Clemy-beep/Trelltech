import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trelltech/arbory/services/user_info_service.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key? key})
      : super(
    key: key,
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
            )
        );
      },
    ),
  );
}