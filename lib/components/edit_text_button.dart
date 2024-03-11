import 'package:flutter/material.dart';

class CustomIconButton extends IconButton {
  const CustomIconButton({
    super.key,
    required VoidCallback super.onPressed,
  }) : super(
          icon: const Icon(Icons.draw),
          color: const Color(0xFFFDDA5F),
        );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
