import 'package:flutter/material.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/chat_screen.dart';
import 'package:myapp/screens/video_call_screen.dart';
import 'package:myapp/screens/user_profile.dart';
import 'screens/log_in_registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dating App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginScreen(),
      initialRoute: '/home_screen',
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: const Center(
              child: Text('Page not found'),
            ),
          ),
        );
      },
      routes: {
        '/home_screen': (context) => const HomeScreen(),
        '/chat_screen': (context) =>  ChatScreen(),
        '/video_call': (context) => const VideoCallScreen(),
        '/user_profile': (context) => const UserProfileScreen(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
          ) 
        ); 
      },
    );
  }
}

  