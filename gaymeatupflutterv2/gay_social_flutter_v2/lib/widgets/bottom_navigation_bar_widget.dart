import 'package:flutter/material.dart';
import '/screens/home_screen.dart';

class BottomNavBarTransparentFb1 extends StatefulWidget {
  final ValueChanged<int> onItemTapped;
  const BottomNavBarTransparentFb1({
    Key? key,
    required this.onItemTapped,
    required String initialRoute,
    required Widget Function(dynamic context) onChatRoute,
    required Widget Function(dynamic context) onUserProfileRoute,
    required Widget Function(dynamic context) onVideoCallRoute,
    required HomeScreen Function(dynamic context) onHomeRoute,
  }) : super(key: key);
  get onVideoCallRoute => null;
  get onChatRoute => null;
  get onUserProfileRoute => null;
  @override
  // ignore: library_private_types_in_public_api
  State<BottomNavBarTransparentFb1> createState() =>
      BottomNavBarTransparentFb1State();
}

class BottomNavBarTransparentFb1State
    extends State<BottomNavBarTransparentFb1> {
  @override
  Widget build(BuildContext context) {
    Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavBarTransparentFb1(
        onItemTapped: widget.onItemTapped,
        initialRoute: '/',
        onHomeRoute: (context) => const HomeScreen(title: 'home_screen',),
        onVideoCallRoute: widget.onVideoCallRoute,
        onChatRoute: widget.onChatRoute,
        onUserProfileRoute: widget.onUserProfileRoute,
      ),
    );
    double height = 56;
    const primaryColor = Colors.orange;
    const secondaryColor = Colors.black54;
    final backgroundColor = Colors.black12.withOpacity(.2);
    return BottomAppBar(
      color: backgroundColor,
      elevation: 0,
      child: Stack(
        children: [
          SizedBox(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarIcon(
                  text: "Home",
                  icon: Icons.home,
                  selected: true,
                  onPressed: () {},
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                NavBarIcon(
                  text: "Video Call",
                  icon: Icons.videocam,
                  selected: false,
                  onPressed: () {},
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                NavBarIcon(
                  text: "Chats",
                  icon: Icons.chat_bubble_rounded,
                  selected: false,
                  onPressed: () {},
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                NavBarIcon(
                  text: "Calendar",
                  icon: Icons.person,
                  selected: false,
                  onPressed: () {},
                  selectedColor: primaryColor,
                  defaultColor: secondaryColor,
                )
              ],
            ),
          ),
        ],
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
