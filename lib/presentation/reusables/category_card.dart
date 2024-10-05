import 'package:flutter/material.dart';
import 'package:fresshi/app/util/color_palette_util.dart';

class CategoryCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double width;
  final double height;
  final double iconSize;

  const CategoryCard({
    super.key,
    required this.label,
    required this.icon,
    this.iconColor = ColorPalette.primaryColor,
    this.backgroundColor = ColorPalette.grayBgColor,
    required this.width,
     this.height = 50, 
     this.iconSize = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Adjust size as needed
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor, // Background color for the card
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize, // Size of the icon
              color: iconColor, // Icon color
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorPalette.primaryTextColor, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
