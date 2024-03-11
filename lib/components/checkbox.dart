import 'package:flutter/material.dart';

class CheckboxExample extends StatefulWidget {
  final String name;

  const CheckboxExample({
    super.key,
    required this.name,
  });

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color(0xfffcc52e);
      }
      return const Color.fromARGB(255, 255, 255, 255);
    }

    return Checkbox(
      checkColor: const Color.fromARGB(255, 0, 0, 0),
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
      side: MaterialStateBorderSide.resolveWith((states) => const BorderSide(
            color: Color(0xfffcc52e),
            width: 2,
          )),
    );
  }
}
