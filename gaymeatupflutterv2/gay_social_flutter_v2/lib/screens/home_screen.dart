// ignore: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';
import 'package:gay_social_flutter_v2/screens/chats_page.dart';
import 'package:gay_social_flutter_v2/screens/user_profile.dart';
import 'package:gay_social_flutter_v2/screens/video_call_screen.dart';
import 'package:gay_social_flutter_v2/widgets/filter_drawer_widget.dart';
import 'package:gay_social_flutter_v2/services/user_service.dart';

import '../widgets/bottom_navigation_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  get userService => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              );
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: OnlineUserFilter(
          listUser: userService.listUser(),
          listViewKey: GlobalKey(), // Add the required argument for 'listViewKey'
          scrollController: ScrollController(),
          currentPosition: null,
          currentLookingFor: null,
          currentAgeRange: const RangeValues(18, 75),
          currentLocation: null,
        ),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 0,
            flexibleSpace: FlexibleSpaceBar(),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: const Color.fromARGB(255, 209, 209, 209),
                  child: Center(
                    child: Text(
                        'User Profile ${listUser[index].username}'), // Replace 'username' with the appropriate property representing the user's name
                  ),
                );
              },
              childCount: listUser.length, // use the length of listUser
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () {
                // Apply filters when button is pressed
                // ignore: unused_local_variable
                List <User> listUser = userService.applyFilters(
                  position: "Position",
                  lookingFor: "Looking For",
                  ageRange: const RangeValues(20, 30),
                  location: "Location",
                );
              },
              child: const Text('Apply Filters'),
            ),
          ),
        ],
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
    final List<User> listUser =
    UserService([]) as List<User>; // Replace [] with your list of users

class UserService {
  UserService(List<User> users) {
    // Add your initialization logic for the UserService here
  }
}

// ListView key
final GlobalKey listViewKey = GlobalKey(
  debugLabel: 'listViewKey',
);

// Scroll controller
final ScrollController scrollController = ScrollController();
