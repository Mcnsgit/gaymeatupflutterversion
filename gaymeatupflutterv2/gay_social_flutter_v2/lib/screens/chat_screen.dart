import 'package:flutter/material.dart';
import '/screens/video_call_screen.dart';
import '../widgets/bottom_naviagtion_bar_widget.dart';
import 'chats_page.dart';
import 'user_profile.dart';
import 'home_screen.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  final List<String> conversations = [
    'Conversation 1',
    'Conversation 2',
    'Conversation 3',
  ];
  final Map<int, Widget> bottomNavScreens = {
    0: HomeScreen(title: 'home_screen',),
    1: const ChatPageScreen(),
    2: const VideoCallScreen(),
    3: const UserProfileScreen(),
  };
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
        initialRoute: '/',
        onItemTapped: (index) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => bottomNavScreens[index]!));
        },
        onChatRoute: (context) => bottomNavScreens[1]!,
        onUserProfileRoute: (context) => bottomNavScreens[3]!,
        onVideoCallRoute: (context) => bottomNavScreens[2]!,
        onHomeRoute: (context) => const HomeScreen(),
      ),
    );
  }
}
