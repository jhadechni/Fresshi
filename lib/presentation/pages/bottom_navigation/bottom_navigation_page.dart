import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fresshi/app/util/color_palette_util.dart';
import 'package:fresshi/presentation/pages/bottom_navigation/navbar_icons.dart';
import 'package:fresshi/presentation/pages/bottom_navigation/navbar_item_model.dart';
import 'package:fresshi/presentation/pages/home/home_page.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int _selectedIndex = 0;

  // List of pages corresponding to each navbar item
  final List<Widget> pages = [
    const Home(),
    const SafeArea(child: Center(child: Text('Map'))),
    const SafeArea(child: Center(child: Text('Favorites'))),
    const SafeArea(child: Center(child: Text('Me'))),
  ];

  // List of navbar items (using enums or models could make this more scalable)
  final List<NavbarItem> navbarItems = [
    NavbarItem(icon: FontAwesomeIcons.house, label: 'Home'),
    NavbarItem(icon: FontAwesomeIcons.basketShopping, label: 'Shop'),
    NavbarItem(icon: FontAwesomeIcons.solidHeart, label: 'Favorites'),
    NavbarItem(icon: FontAwesomeIcons.userLarge, label: 'Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index:
            _selectedIndex, // Show the selected page without rebuilding others
        children: pages,
        
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0), // Adjusted padding for the navbar
        child: Container(
          decoration: BoxDecoration(
            color: ColorPalette
                .primaryColor, // Solid dark blue color for the navbar
            borderRadius: BorderRadius.circular(30), // Rounded corners
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(navbarItems.length, (index) {
              return NavBarItemWidget(
                icon: navbarItems[index].icon,
                isSelected: _selectedIndex == index,
                onTap: () => _onItemTapped(index),
              );
            }),
          ),
        ),
      ),
    );
  }
}
