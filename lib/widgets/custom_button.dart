import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.black, // Default color set to black
    this.textColor = Colors.white, // Default text color set to white
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(color),
        foregroundColor: WidgetStateProperty.all<Color>(textColor),
      ),
      child: Text(text),
    );
  }
}
