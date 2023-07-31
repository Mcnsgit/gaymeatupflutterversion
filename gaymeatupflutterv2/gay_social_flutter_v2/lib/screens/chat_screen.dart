import 'package:flutter/material.dart';
import '/screens/video_call_screen.dart';
import '../widgets/bottom_navigation_bar_widget.dart';
import 'chats_page.dart';
import 'user_profile.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  final List<String> conversations = [
    'Conversation 1',
    'Conversation 2',
    'Conversation 3',
  ];
  final Map<int, Widget> bottomNavScreens = {
    1: const ChatPageScreen(),
    2: const VideoCallScreen(),
    3: const UserProfileScreen(),
  };
  
  get routes => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(conversations[index]),
            onTap: () {
              // Handle conversation tap using a state management solution
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavBarTransparentFb1(
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChatPageScreen()));
          } else if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChatPageScreen()));
          } else if (index == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VideoCallScreen()));
          } else if (index == 3) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserProfileScreen()));
          }
        },
      ),
    );
  }
}
