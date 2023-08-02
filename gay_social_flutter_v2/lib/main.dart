import 'package:flutter/material.dart';
import 'package:gay_social_flutter_v2/screens/home_screen.dart';
import 'package:gay_social_flutter_v2/screens/chat_screen.dart';
import 'package:gay_social_flutter_v2/screens/user_profile.dart';
import 'package:gay_social_flutter_v2/screens/video_call_screen.dart';
import 'package:gay_social_flutter_v2/services/filter_settings.dart';
import '/services/online_user_filter_widget.dart';,
import 'backend/models/user_model.dart';
import 'services/location_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/chat_screen': (context) => ChatScreen(),
        '/video_call': (context) => const VideoCallScreen(),
        '/user_profile': (context) => const UserProfileScreen(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
              endDrawer: const Drawer(),
            ),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FilterSettingsData filterSettingsData = FilterSettingsData(
    listUser: [],
    currentPosition: null,
    currentLookingFor: null,
    currentLocation: null,
    currentAgeRange: const RangeValues(20, 30),   
    _buildUserCard: _buildUserCard
  );
late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    filterSettingsData = FilterSettingsData(
      listUser: [],
      currentPosition: null,
      currentLookingFor: null,
      currentLocation: null,
      currentAgeRange: const RangeValues(20, 30),
    );

    _fetchUsers();
  }

  void _fetchUsers() {
    // Fetch your users and update filterSettingsData.listUser
    // Here is just a dummy users list
    setState(() {
      filterSettingsData.listUser = [
        'User 1',
        'User 2',
        'User 3',
        // ...
      ];
    });
  }

  void _applyFilters(FilterSettingsData newSettings) {
    setState(() {
      filterSettingsData = newSettings;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        endDrawer: Drawer(
          child: 
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilterSettings(
                    onApplyFilters: _applyFilters,
                    filterSettingsData: filterSettingsData,
                    locationService: null,
                    LocationService: LocationService(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}