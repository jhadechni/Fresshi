import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fresshi/app/util/color_palette.dart';
import 'package:lottie/lottie.dart';

class PaymentMethod extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color borderColor;
  final Color iconColor;
  final double borderRadius;
  final double height;
  final double width; // Added custom width

  const PaymentMethod({
    required this.text,
    required this.icon,
    this.borderColor = ColorPalette.primaryColor, // Default border color
    this.iconColor = ColorPalette.dividerColor, // Default icon color
    this.borderRadius = 20.0, // Default border radius
    required this.height, // Default height
    required this.width, // Default width
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width, // Added width property
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 3.0,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side - text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18.0,
                color: ColorPalette.primaryTextColor,
              ),
            ),
          ),
          // Right side - icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              icon,
              size: 30.0,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}
