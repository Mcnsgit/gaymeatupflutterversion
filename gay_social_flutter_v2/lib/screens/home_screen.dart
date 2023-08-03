import 'package:flutter/material.dart';
import 'package:gay_social_flutter_v2/services/user_service.dart';
import '/widgets/bottom_navigation_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
  
  onItemTapped(int i) {}
}

class _HomeScreenState extends State<HomeScreen> {
  late UserService userService =  UserService(
    List as List<User> ,User,
  );
  final GlobalKey listViewKey = GlobalKey(debugLabel: 'listViewKey');
  final ScrollController scrollController = ScrollController();
  final BottomAppBar bottomNavigationBar = const BottomAppBar(
    
  );
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          endDrawer: const Drawer(),
          ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            key: listViewKey,
          )
        ), 
        bottomNavigationBar:
          BottomAppBar(
            elevation: 0,
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,                     children: [
                    NavBarIcon(
                      text: "Home",
                      icon: Icons.home,
                      selected: false,
                      onPressed: () => widget.onItemTapped(0),
                    ),
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
              )
          ),
      );
    }
} 
        //  ), userName,
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
    



  // Initial values for filter parameters
  // String? currentPosition = 'Software Developer';
  // String? currentLookingFor = 'Friends';
  // RangeValues ageRange = RangeValues(20, 50);
  // String? currentLocation = 'California';

  // List<User>? _listUser;

  // List<User>? get listUser {
  //   return _listUser;
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   fetchUsers();
  // }

  // fetchUsers() async {
  //   _listUser = await userService.listUser();
  //   setState(() {});
  // }