// NavbarItem model to encapsulate icon and label (extendable in future)
import 'package:flutter/material.dart';

class NavbarItem {
  final IconData icon;
  final String label;

  NavbarItem({required this.icon, required this.label});
}