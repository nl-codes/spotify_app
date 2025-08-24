import 'package:flutter/material.dart';
import 'package:spotify_app/screens/root/page/root_screen.dart';

class Footer extends StatelessWidget {
  final String selectedTab;
  const Footer({required this.selectedTab, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      decoration: BoxDecoration(color: Color.fromRGBO(18, 18, 18, 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => RootScreen()),
              (Route<dynamic> route) => false,
            ),
            child: _FooterComponent(
              componentIcon: Icons.home,
              componentName: "Home",
              isSelected: selectedTab.toLowerCase() == "home" ? true : false,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => RootScreen(screenIndex: 1),
              ),
              (Route<dynamic> route) => false,
            ),
            child: _FooterComponent(
              componentIcon: Icons.search,
              componentName: "Search",
              isSelected: selectedTab.toLowerCase() == "search" ? true : false,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => RootScreen(screenIndex: 2),
                maintainState: false,
              ),
              (Route<dynamic> route) => false,
            ),
            child: _FooterComponent(
              componentName: "Library",
              imageIconPath:
                  "https://cdn-icons-png.flaticon.com/512/2908/2908601.png",
              isSelected: selectedTab.toLowerCase() == "library" ? true : false,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterComponent extends StatelessWidget {
  final bool isSelected;
  final IconData? componentIcon;
  final String? imageIconPath;
  final String componentName;

  const _FooterComponent({
    required this.isSelected,
    this.componentIcon,
    this.imageIconPath,
    required this.componentName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (componentIcon != null)
          Icon(componentIcon, color: isSelected ? Colors.white : Colors.grey)
        else if (imageIconPath != null)
          Image.network(
            imageIconPath ?? "",
            width: 24,
            height: 24,
            fit: BoxFit.cover,
            color: isSelected ? Colors.white : Colors.grey,
          ),
        Text(
          componentName,
          style: TextStyle(color: isSelected ? Colors.white : Colors.grey),
        ),
      ],
    );
  }
}
