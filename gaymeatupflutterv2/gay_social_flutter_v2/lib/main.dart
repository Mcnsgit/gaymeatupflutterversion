import 'package:flutter/material.dart';
import 'package:gay_social_flutter_v2/methods/filter_methods.dart';
import 'package:gay_social_flutter_v2/screens/home_screen.dart';
import 'package:gay_social_flutter_v2/widgets/filter_drawer_widget.dart';
import 'package:provider/provider.dart';
import 'package:gay_social_flutter_v2/screens/chat_screen.dart';
import 'package:gay_social_flutter_v2/screens/user_profile.dart';
import 'package:gay_social_flutter_v2/screens/video_call_screen.dart';

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
      home: ChangeNotifierProvider<OnlineUserFilter>(
        create: (context) => OnlineUserFilter(
          listUser: [],
          listViewKey: GlobalKey(debugLabel: 'listViewKey'),
          scrollController: ScrollController(),
          currentPosition: null,
          currentLookingFor: null,
          currentAgeRange: const RangeValues(18, 75),          
          currentLocation: null,
          userName: [],
          ageRange: const RangeValues(18, 75),
          AgeRange: const RangeValues(18, 75),          
        ),
        child: HomeScreen(),
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
