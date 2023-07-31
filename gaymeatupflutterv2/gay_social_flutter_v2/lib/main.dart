import 'package:flutter/material.dart';
import 'package:gay_social_flutter_v2/screens/home_screen.dart';
import 'package:gay_social_flutter_v2/services/online_user_filter_widget.dart';
import 'package:provider/provider.dart';
import 'package:gay_social_flutter_v2/screens/chat_screen.dart';
import 'package:gay_social_flutter_v2/screens/user_profile.dart';
import 'package:gay_social_flutter_v2/screens/video_call_screen.dart';
import 'package:gay_social_flutter_v2/services/user_service.dart'; // This is the correct import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample user list for the sake of example
    return MaterialApp(
      title: 'My App',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange),
      ),
      home: ChangeNotifierProvider<>(
        create: List <User> => [ User],
        child: const HomeScreen(),
      ),
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
        '/chat_screen': (context) => ChatScreen(),
        '/video_call': (context) => const VideoCallScreen(),
        '/user_profile': (context) => const UserProfileScreen(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
          ),
        );
      },
    );
  }
}
