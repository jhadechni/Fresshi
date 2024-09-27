import 'package:flutter/material.dart';
import 'package:fresshi/app/util/color_palette.dart';

class CustomTextInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final double width;
  final double height;
  final TextEditingController controller;

  CustomTextInput({
    required this.labelText,
    required this.hintText,
    required this.width,
    required this.height,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 14
          ),
        ),
        const SizedBox(height: 5), // Space between label and input box
        SizedBox(
          width: width,
          height: height,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), // Rounded edges
                borderSide: const BorderSide(
                  color: ColorPalette.dividerColor, // Gray border color
                  width: 1.0, // Skinny border width
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: ColorPalette.dividerColor, // Gray border when not focused
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 31, 28, 28), // Gray border when focused
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
