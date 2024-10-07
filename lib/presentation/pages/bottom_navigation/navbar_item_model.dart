import 'package:flutter/material.dart';

class NavbarItem {
  final IconData icon;
  final String label;
  final Color? selectedColor;   // Optional custom color for when item is selected
  final Color? unselectedColor; // Optional custom color for when item is not selected
  final String? tooltip;        // Tooltip for better UX
  final bool showBadge;         // Option to show a badge (like for notifications)

  NavbarItem({
    required this.icon,
    required this.label,
    this.selectedColor,
    this.unselectedColor,
    this.tooltip,
    this.showBadge = false,     // Default to false unless specified
  });
}
