import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.date,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String date;
  static const IconData defaultIcon = Icons.workspaces_outlined;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Card(
        color: const Color(0xfffff5d2),
        child: ListTile(
          leading: const Icon(
            defaultIcon,
            size: 24.0,
            color: Color(0xff141946),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontFamily: 'LexendExa',
              color: Color(0xff141946),
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              fontFamily: 'LexendExa',
              color: Color(0xff141946),
            ),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Created on:',
                style: TextStyle(
                  fontFamily: 'LexendExa',
                  color: Color(0xff141946),
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontFamily: 'LexendExa',
                  color: Color(0xff141946),
                ),
              ),
            ],
          ),
          contentPadding: const EdgeInsets.all(16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
    );
  }
}
