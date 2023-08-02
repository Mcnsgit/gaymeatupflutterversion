import 'package:flutter/material.dart';

class BottomNavigationBar extends StatefulWidget {
  final ValueChanged<int> onItemTapped;
  const BottomNavigationBar({
    Key? key,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationBarState createState() => 
  _BottomNavigationBarState();
}

class _BottomNavigationBarState
    extends State<BottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    double height = 56;
    const primaryColor = Colors.orange;
    const secondaryColor = Colors.black54;
    final backgroundColor = Colors.black12.withOpacity(.2);

    return BottomAppBar(
      color: backgroundColor,
      elevation: 0,
      child: SizedBox(
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarIcon(
              text: "Home",
              icon: Icons.home,
              selected: true,
              onPressed: () => widget.onItemTapped(0),
              defaultColor: secondaryColor,
              selectedColor: primaryColor,
            ),
            NavBarIcon(
              text: "Video Call",
              icon: Icons.videocam,
              selected: false,
              onPressed: () => widget.onItemTapped(1),
              defaultColor: secondaryColor,
              selectedColor: primaryColor,
            ),
            NavBarIcon(
              text: "Chats",
              icon: Icons.chat_bubble_rounded,
              selected: false,
              onPressed: () => widget.onItemTapped(2),
              defaultColor: secondaryColor,
              selectedColor: primaryColor,
            ),
            NavBarIcon(
              text: "Profile",
              icon: Icons.person,
              selected: false,
              onPressed: () => widget.onItemTapped(3),
              selectedColor: primaryColor,
              defaultColor: secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color(0xffFF8527),
      this.defaultColor = Colors.black54})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}
