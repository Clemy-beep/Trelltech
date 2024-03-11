import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trelltech/arbory/auth_service.dart';

class CustomNavigationBar extends StatelessWidget {
  /// Constructs a [CustomNavigationBar]
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return(
        Container(
            height: 46,
            color: Colors.amberAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () => {
                      print('Home')
                    },
                    icon: const Icon(
                      Icons.cottage_outlined,
                      color: Colors.black,
                      size: 26,
                    )
                ),
                IconButton(
                    onPressed: () => {
                      print('Search')
                    },
                    icon: const Icon(
                      Icons.account_circle_outlined,
                      color: Colors.black,
                      size: 26,
                    )
                ),
                IconButton(
                    onPressed: () => {
                      Auth().signOut()
                    },
                    icon: const Icon(
                      Icons.logout_outlined,
                      color: Colors.black,
                      size: 26,
                    )
                ),
              ],
            )
        )
    );
  }

}