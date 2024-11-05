import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String? title;

  final Function()? onpress;

  const Button({
    super.key,
    this.title,
    this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpress,
      style: const ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(100, 20)),
          backgroundColor: WidgetStatePropertyAll(Colors.white)),
      child: Text(title!),
    );
  }
}
