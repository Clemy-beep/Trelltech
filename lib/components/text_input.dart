import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String name;

  const CustomTextField({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 24.0),
          child: Text(
            '$name :',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          width: MediaQuery.of(context).size.width - 32.0,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16.0),
              filled: true,
              fillColor: const Color(0xffffe4a1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
