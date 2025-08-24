import 'package:flutter/material.dart';
import 'package:spotify_app/screens/root/home/page/home_screen.dart';
import 'package:spotify_app/screens/root/library/page/library_screen.dart';
import 'package:spotify_app/screens/root/search/page/search_screen.dart';

class RootScreen extends StatefulWidget {
  final int? screenIndex;
  const RootScreen({super.key, this.screenIndex});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.screenIndex ?? 0;
    });
  }

  final List<Widget> _screens = [HomeScreen(), SearchScreen(), LibraryScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white54),
            label: "Home",
            activeIcon: Icon(Icons.home, color: Colors.white70),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.white54),
            label: "Search",
            activeIcon: Icon(Icons.search, color: Colors.white70),
          ),
          BottomNavigationBarItem(
            icon: Image.network(
              "https://cdn-icons-png.flaticon.com/512/2908/2908601.png",
              color: Colors.white54,
              width: 24,
              height: 24,
            ),
            activeIcon: Image.network(
              "https://cdn-icons-png.flaticon.com/512/2908/2908601.png",
              color: Colors.white70,
              width: 24,
              height: 24,
            ),
            label: "Library",
          ),
        ],
      ),
    );
  }
}
