import 'package:flutter/material.dart';
import 'package:gay_social_flutter_v2/services/user_service.dart';
import '/widgets/bottom_navigation_bar_widget.dart';
import '../services/online_user_filter_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserService userService = UserService();
  final GlobalKey listViewKey = GlobalKey(debugLabel: 'listViewKey');
  final ScrollController scrollController = ScrollController();
  final bottomNavigationBar = BottomAppBar(
    child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarIcon(
              text: "Home",
              icon: Icons.home,
              selected: true,
              onPressed: () {},
            ),
            NavBarIcon(
              text: "Video Call",
              icon: Icons.videocam,
              selected: false,
              onPressed: () {},
            ),
            NavBarIcon(
              text: "Chats",
              icon: Icons.chat_bubble_rounded,
              selected: false,
              onPressed: () {},
            ),
            NavBarIcon(
              text: "Profile",
              icon: Icons.person,
              selected: false,
              onPressed: () {},
            )
          ],
        ),
      ),
      );
      // @override
      //   Widget build(BuildContext context) {
      //     return Scaffold(
      //       appBar: AppBar(
      //       title: const Text('Home'),
      //       endDrawer: Drawer(
      //         child: OnlineUserFilter(
      //           userName: _listUserCard(),
      //           duration: const Duration(),
      //           tween: Tween(),
      //           builder: (BuildContext context, dynamic value, Widget? child) {
      //             return Container();
      //           },
      //         ), userName,
      //         listViewKey: GlobalKey (debugLabel: 'listViewKey'),
      //     scrollController: scrollController,
      //     currentPosition: currentPosition,
      //     currentLookingFor: currentLookingFor,
      //     ageRange: ageRange,
      //     currentLocation: currentLocation,
      //         ),
      // ),
      // body: CustomScrollView(
      //   controller: scrollController,
      //   slivers: <Widget>[
      //     SliverGrid(
      //       delegate: SliverChildBuilderDelegate(
      //         (BuildContext context, int index) {
      //           return Container(
      //             color: const Color.fromARGB(255, 209, 209, 209),
      //             child: Center(
      //               child: Text(
      //                   'User Profile ${_listUser != null ? _listUser![index].username : 'Loading'}'),
      //             ),
      //           );
      //         },
      //         childCount: _listUser != null ? _listUser!.length : 0,
      //       ),
      //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2,
      //         crossAxisSpacing: 8,
      //         mainAxisSpacing: 8,
      //       ),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: BottomAppBar(
      elevation: 0,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarIcon(
              text: "Home",
              icon: Icons.home,
              selected: true,
              onPressed: () => widget.onItemTapped(0),),
            NavBarIcon(
              text: "Video Call",
              icon: Icons.videocam,
              selected: false,
              onPressed: () => widget.onItemTapped(1),
            ),
            NavBarIcon(
              text: "Chats",
              icon: Icons.chat_bubble_rounded,
              selected: false,
              onPressed: () => widget.onItemTapped(2),
            ),
            NavBarIcon(
              text: "Profile",
              icon: Icons.person,
              selected: false,
              onPressed: () => widget.onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}


  // Initial values for filter parameters
  String? currentPosition = 'Software Developer';
  String? currentLookingFor = 'Friends';
  RangeValues ageRange = RangeValues(20, 50);
  String? currentLocation = 'California';

  List<User>? _listUser;

  List<User>? get listUser {
    return _listUser;
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  fetchUsers() async {
    _listUser = await userService.listUser();
    setState(() {});
  }