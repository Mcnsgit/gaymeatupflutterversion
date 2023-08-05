import 'package:flutter/material.dart';
import '/screens/video_call_screen.dart';
import '../widgets/nav_widget.dart'as nav;
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
    2: const VideoCallScreen(key: Key('VideoCallScreen'),),
    3: const UserProfileScreen(),
  };
  
  get routes => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
        endDrawer: const Drawer(),
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
      bottomNavigationBar: const nav.Nav(),
        
    );
  }
}