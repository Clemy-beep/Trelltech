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
  static const IconData defaultIcon = Icons.drag_indicator_sharp;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Card(
        color: const Color(0xFFFFF5D2),
        child: ListTile(
          leading: Icon(
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
          trailing: Text(
            date,
            style: const TextStyle(
              fontFamily: 'LexendExa',
              color: Colors.black,
            ),
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
