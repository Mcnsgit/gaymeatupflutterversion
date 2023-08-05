import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);


  @override
  // ignore: library_private_types_in_public_api
  _NavState createState() => _NavState();
}
class _NavState extends State<Nav> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavBarIcon(
                text: "Home",
                icon: Icons.home,
                selected: selectedIndex == 0,
                onPressed: () => onItemTapped(0),
              ),
              NavBarIcon(
                text: "Video Call",
                icon: Icons.videocam,
                selected: selectedIndex == 1,
                onPressed: () => onItemTapped(1),
              ),
              NavBarIcon(
                text: "Chats",
                icon: Icons.chat_bubble_rounded,
                selected: selectedIndex == 2,
                onPressed: () => onItemTapped(2),
              ),
              NavBarIcon(
                text: "Profile",
                icon: Icons.person,
                selected: selectedIndex == 3,
                onPressed: () => onItemTapped(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class NavBarIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final VoidCallback onPressed;
  const NavBarIcon({
    Key? key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      color: selected ? Colors.blue : Colors.grey,
    );
  }
}