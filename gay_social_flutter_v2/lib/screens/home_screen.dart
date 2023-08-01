import 'package:flutter/material.dart';
import 'package:gay_social_flutter_v2/screens/chats_page.dart';
import 'package:gay_social_flutter_v2/screens/user_profile.dart';
import 'package:gay_social_flutter_v2/screens/video_call_screen.dart';
import 'package:gay_social_flutter_v2/widgets/filter_drawer_widget.dart';
import 'package:gay_social_flutter_v2/services/user_service.dart';
import '../widgets/bottom_navigation_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final UserService userService =
      UserService([]); // Initialize with an empty list
  late final List<User> listUser = []; // Initialize with an empty list
  final GlobalKey listViewKey =
      GlobalKey(debugLabel: 'listViewKey'); // ListView key
  final ScrollController scrollController =
      ScrollController(); // Scroll controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: OnlineUserFilter(
          listUser: const [],
          listViewKey: GlobalKey(debugLabel: 'listViewKey'),
          scrollController: ScrollController(),
          currentPosition: null,
          currentLookingFor: null,
          currentAgeRange: const RangeValues(18, 75),
          currentLocation: null,
          userName: const [],
          ageRange: const RangeValues(18, 75),
        ),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          // ...
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: const Color.fromARGB(255, 209, 209, 209),
                  child: Center(
                    child: Text('User Profile ${listUser[index].username}'),
                  ),
                );
              },
              childCount: listUser.length,
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

class UserService {
  UserService(List<User> users) {
    // Add your initialization logic for the UserService here
  }

  List<User> listUser() {
    // Return the list of users
    return []; // Replace with your implementation
  }

  List<User> applyFilters({
    String? position,
    String? lookingFor,
    RangeValues? ageRange,
    String? location,
  }) {
    // Apply filters and return the filtered list of users
    return []; // Replace with your implementation
  }
}
