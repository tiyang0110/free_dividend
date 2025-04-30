import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(label: 'a', icon: Icon(Icons.abc)),
        BottomNavigationBarItem(label: 'a', icon: Icon(Icons.headphones)),
        BottomNavigationBarItem(label: 'a', icon: Icon(Icons.macro_off)),
      ],
    );
  }
}
