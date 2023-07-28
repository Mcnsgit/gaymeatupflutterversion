import 'package:flutter/material.dart';

class ChatPageScreen extends StatefulWidget {
  const ChatPageScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatPageScreenState createState() => _ChatPageScreenState();
}

class _ChatPageScreenState extends State<ChatPageScreen> {
  bool _isChatInfoDrawerOpen = false;

  void _toggleChatInfoDrawer() {
    setState(() {
      _isChatInfoDrawerOpen = !_isChatInfoDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Chat with User'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: _toggleChatInfoDrawer,
          ),
        ],
      ),
      body: Column(
        children: [
          // Placeholder for the chat messages
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: const Center(
                child: Text('Chat Messages Placeholder'),
              ),
            ),
          ),
          // Typing box and send button
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Implement sending the message here
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // Implement sending images or emojis here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'Video Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1, // Set the index of the current item
        onTap: (index) {
          // Handle bottom navigation bar item tap here
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            // You are already on the Chat Page, no need to navigate again
          } else if (index == 2) {
            Navigator.pushNamed(context, '/video_call');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/user_profile');
          }
        },
      ),
      // Chat info drawer
      endDrawer: _isChatInfoDrawerOpen
          ? Drawer(
              child: Container(
                color: Colors.white,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text(
                        'Chat Info',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    // Add chat info and settings content here...
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
