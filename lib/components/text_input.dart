import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
