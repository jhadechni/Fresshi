// Widget for individual navigation bar item
import 'package:flutter/material.dart';
import 'package:fresshi/app/util/color_palette_util.dart';

class NavBarItemWidget extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const NavBarItemWidget({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10), // Padding around the icon
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.white : ColorPalette.primaryColor, // Dynamic background color based on selection
        ),
        child: Icon(
          icon,
          color: isSelected ? ColorPalette.primaryColor : Colors.white, // Dynamic icon color based on selection
          size: 30, // Adjust the size to make it fit within the circle
        ),
      ),
    );
  }
}
