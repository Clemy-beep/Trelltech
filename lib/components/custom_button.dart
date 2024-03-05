import 'package:flutter/material.dart';

class CustomButton extends TextButton {
  CustomButton({
    super.key,
    required String text,
    required IconData? iconName,
    required VoidCallback super.onPressed,
  }) : super(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
        padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        )),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(iconName, size: 20, color: Colors.black),
          const SizedBox(width: 8),
          Text(text.toLowerCase(),
              style: const TextStyle(
                fontFamily: 'LexendExa',
                letterSpacing: 10,
                color: Colors.black,
              )
          ),
        ],
      ));
}