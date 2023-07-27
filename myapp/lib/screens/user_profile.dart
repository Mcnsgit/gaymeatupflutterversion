import 'package:flutter/material.dart';
import 'bottom_naviagtion_bar_widget.dart';
import 'chat_screen.dart';
import 'home_screen.dart';
import 'video_call_screen.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context); // Navigate back when the back button is pressed.
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/user_avatar.png'), // Replace with the actual user avatar.
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe', // Replace with the user's name.
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Age: 28', // Replace with the user's age.
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              'Location: New York', // Replace with the user's location.
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              'About Me', // Replace with a section title like "About Me" or "Bio".
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'I love hiking and exploring new places!', // Replace with the user's bio.
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add functionality to edit the user's profile.
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarTransparentFb1(
        initialRoute: '/',
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/chat');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/video_call');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/user_profile');
          }
        },
        onHomeRoute: (context) => const HomeScreen(),
        onChatRoute: (context) => ChatScreen(),
        onUserProfileRoute: (context) => const UserProfileScreen(),
        onVideoCallRoute: (context) => const VideoCallScreen(),
      ),
    );
  }
}
