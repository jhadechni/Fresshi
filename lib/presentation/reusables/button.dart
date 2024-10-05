import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color buttonColor;

  RoundedButton({super.key, 
    required this.buttonText,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.buttonColor,
  });

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor : widget.buttonColor,
          elevation:8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0), // Rounded edges
          ),
        ),
        child: Text(
          widget.buttonText,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
