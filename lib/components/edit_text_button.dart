import 'package:flutter/material.dart';

class CustomIconButton extends IconButton {
  const CustomIconButton({
    super.key,
    required VoidCallback super.onPressed,
  }) : super(
          icon: const Icon(Icons.draw),
          color: const Color(0xfffcda5e),
        );
}

class TestButton extends StatelessWidget {
  const TestButton({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CustomIconButton(
            onPressed: () {
              print('IconButton Pressed!');
            },
          ),
        ),
      ),
    );
  }
}
