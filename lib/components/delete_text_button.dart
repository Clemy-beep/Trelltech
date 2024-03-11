import 'package:flutter/material.dart';

class CustomIconDelete extends IconButton {
  const CustomIconDelete({
    super.key,
    required VoidCallback super.onPressed,
  }) : super(
          icon: const Icon(Icons.delete_forever_sharp),
          color: const Color.fromARGB(255, 180, 39, 0),
        );
}

class TestButton extends StatelessWidget {
  const TestButton({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CustomIconDelete(
            onPressed: () {
              print('IconButton Pressed!');
            },
          ),
        ),
      ),
    );
  }
}
