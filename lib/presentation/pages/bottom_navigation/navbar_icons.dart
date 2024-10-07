import 'package:flutter/material.dart';
import 'package:fresshi/app/util/color_palette_util.dart';

class NavBarItemWidget extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;       // New: Label for the navigation item
  final bool showBadge;        // New: Option to show a badge

  const NavBarItemWidget({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    this.showBadge = false,    // Default to false unless specified
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none, // Allows badge to overflow the icon container
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? Colors.white : ColorPalette.primaryColor,
                ),
                child: Icon(
                  icon,
                  color: isSelected ? ColorPalette.primaryColor : Colors.white,
                  size: isSelected ? 35 : 30, // Change size when selected
                ),
              ),
              if (showBadge) // Conditional rendering of badge
                Positioned(
                  right: -5,
                  top: -5,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
