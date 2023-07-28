import 'dart:core';

import 'package:flutter/material.dart';
import '../../widgets/filter_drawer_widget.dart';
import '../../widgets/bottom_navigation_bar_widget.dart';
import '../../screens/chat_screen.dart';
import '../../screens/video_call_screen.dart';
import '../../screens/user_profile.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String>? listUser = ['A', 'B', 'C', 'D', 'E'];
  final listViewKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  final bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _onRefresh();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      listUser!.addAll(['F', 'G', 'H']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // access title using widget.title
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ],
      ),
      endDrawer: const FilterDrawer(),
      body: const Center(child: Text('Home Screen')),
      floatingActionButton: _isLoading
          ? const FloatingActionButton(
              onPressed: null,
              child: CircularProgressIndicator(),
            )
          : null,
      bottomNavigationBar: BottomNavBarTransparentFb1(
        initialRoute: '/home_screen',
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const HomeScreen(title: 'Home Screen')));
          } else if (index == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChatScreen()));
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
        }, onChatRoute: (context)  => ChatScreen(),
        onHomeRoute: (context) =>  const HomeScreen(title: 'Gay Meat Up'),
        onUserProfileRoute: (context) => const UserProfileScreen(),
        onVideoCallRoute: (context) => const VideoCallScreen(),
      ),
    );
  }
}
