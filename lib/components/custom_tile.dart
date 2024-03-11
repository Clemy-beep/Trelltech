import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
  });

  final String title;
  final String subtitle;
  final List<Widget> children;
  static const IconData defaultIcon = Icons.format_list_bulleted_sharp;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Card(
        color: const Color(0xFFFFF5D2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ExpansionTile(
          leading: const Icon(
            defaultIcon,
            size: 24.0,
            color: Colors.black,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontFamily: 'LexendExa',
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              fontFamily: 'LexendExa',
              color: Colors.black,
            ),
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          tilePadding: const EdgeInsets.all(16.0),
          children: children,
        ),
      ),
    );
  }
}
