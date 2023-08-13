import 'package:flutter/material.dart';
import '../widgets/app_header_bar_main.dart';
import 'package:flutter_provider/flutter_provider.dart';

const routeHome = '/';
const routeSettings = '/filterDrawer';
const routePrefixDeviceSetup = '/setup/';
const routeDeviceSetupStart = '/setup/$routeDeviceSetupStartPage';
const routeDeviceSetupStartPage = 'find_devices';
const routeDeviceSetupSelectDevicePage = 'select_device';
const routeDeviceSetupConnectingPage = 'connecting';
const routeDeviceSetupFinishedPage = 'finished';
//  The main function initializes the Flutter application and sets up the MaterialApp with a dark theme. It also defines the routes for different screens.
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.blue,
        ),
      ),
      onGenerateRoute: (filterDrawer) {
        late Widget page;
        if (filterDrawer.name == routeHome) {
          page = const HomeScreen(title: 'Gay Meat Up',);
        } else if (filterDrawer.name == routeSettings) {
          page = FilterDrawerScreen(
            onApplyFilters: (filterSettingsData) {},
          );
        // } else if (filterDrawer.name!.startsWith(routePrefixDeviceSetup)) {
        //   final subRoute =
        //       filterDrawer.name!.substring(routePrefixDeviceSetup.length);
        //   page = SetupFlow(
        //     setupPageRoute: subRoute,
        } else {
          throw Exception('Unknown route: ${filterDrawer.name}');
        }

        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: filterDrawer,
        );
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required String title});

  static const appTitle = 'Gay Meat Up';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: HomeScreen(title: appTitle),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({required this.title});

  final String title;

  @override
  State<_HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  SliverAppBar2 appBar = const SliverAppBar2();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Profile',
      style: optionStyle,
    ),
    Text(
      'Index 2: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SliverAppBar2(),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
          endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF222222),
              ),
              child: Text('Online Users'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Welcome'),
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_list_outlined),
          onPressed: () {
            Navigator.pushNamed(context, routeSettings);
          },
        ),
      ],
    );
  }

  List<User> onlineUsers = [
    // Example user data
    User(position: 'top', lookingFor: 'now', location: 'Uk', age: 25),
    User(position: 'vers', lookingFor: 'now', location: 'UK', age: 30),
    // ... Add more users as needed
  ];

  void _filterUsers(FilterSettingsData filterData) {
    setState(() {
      onlineUsers = onlineUsers.where((user) {
        bool matchesPosition = filterData.currentPosition == null ||
            user.position == filterData.currentPosition;
        bool matchesLookingFor = filterData.currentLookingFor == null ||
            user.lookingFor == filterData.currentLookingFor;
        bool matchesLocation = filterData.getLocation == null ||
            user.location == filterData.getLocation;
        bool matchesAgeRange = user.age >= filterData.currentAgeRange.start &&
            user.age <= filterData.currentAgeRange.end;

        return matchesPosition &&
            matchesLookingFor &&
            matchesLocation &&
            matchesAgeRange;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView.builder(
        itemCount: onlineUsers.length,
        itemBuilder: (context, index) =>
            ListTile(title: Text(onlineUsers[index].position)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                FilterDrawerScreen(onApplyFilters: _filterUsers),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Welcome'),
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_list_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FilterDrawerScreen(
                  onApplyFilters: _filterUsers,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class FilterDrawerScreen extends StatelessWidget {
  final Function(FilterSettingsData) onApplyFilters;

  const FilterDrawerScreen({Key? key, required this.onApplyFilters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // For the sake of brevity, the body is simplified.
    // You can put any filter options inside the body.
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // For the sake of the example, I'm creating dummy filterData.
                // In reality, this should be constructed based on user's selections in the filter screen.
                FilterSettingsData filterData = FilterSettingsData(
                  listUser: [], // Example list
                  currentPosition: 'Manager',
                  currentLookingFor: null,
                  getLocation: 'US',
                  currentAgeRange: const RangeValues(20, 30),
                );
                onApplyFilters(filterData);
                Navigator.pop(context);
              },
              child: const Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('User Filter'),
    );
  }
}

class User {
  final String position;
  final String lookingFor;
  final String location;
  final double age;

  User(
      {required this.position,
      required this.lookingFor,
      required this.location,
      required this.age});
}

class FilterSettingsData {
  List<String>? listUser;
  String? currentPosition;
  String? currentLookingFor;
  String? getLocation;
  RangeValues currentAgeRange;

  FilterSettingsData({
    this.listUser,
    this.currentPosition,
    this.currentLookingFor,
    this.getLocation,
    required this.currentAgeRange,
  });
}


// //The SetupFlow widget is a stateful widget that represents a setup flow for a device. It includes a navigator to handle the different steps of the setup process.
// @immutable
// class SetupFlow extends StatefulWidget {
//   static SetupFlowState of(BuildContext context) {
//     return context.findAncestorStateOfType<SetupFlowState>()!;
//   }

//   const SetupFlow({
//     super.key,
//     required this.setupPageRoute,
//   });

//   final String setupPageRoute;

//   @override
//   SetupFlowState createState() => SetupFlowState();
// }

// class SetupFlowState extends State<SetupFlow> {
//   final _navigatorKey = GlobalKey<NavigatorState>();

//   @override
//   void initState() {
//     super.initState();
//   }

//   void _onDiscoveryComplete() {
//     _navigatorKey.currentState!.pushNamed(routeDeviceSetupSelectDevicePage);
//   }

//   void _onDeviceSelected(String deviceId) {
//     _navigatorKey.currentState!.pushNamed(routeDeviceSetupConnectingPage);
//   }

//   void _onConnectionEstablished() {
//     _navigatorKey.currentState!.pushNamed(routeDeviceSetupFinishedPage);
//   }

//   Future<void> _onExitPressed() async {
//     final isConfirmed = await _isExitDesired();

//     if (isConfirmed && mounted) {
//       _exitSetup();
//     }
//   }

//   Future<bool> _isExitDesired() async {
//     return await showDialog<bool>(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: const Text('Are you sure?'),
//                 content: const Text(
//                     'If you exit device setup, your progress will be lost.'),
//                 actions: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop(true);
//                     },
//                     child: const Text('Leave'),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop(false);
//                     },
//                     child: const Text('Stay'),
//                   ),
//                 ],
//               );
//             }) ??
//         false;
//   }

  // void _exitSetup() {
  //   Navigator.of(context).pop();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return WillPopScope(
  //     onWillPop: _isExitDesired,
  //     child: Scaffold(
  //       appBar: _buildFlowAppBar(),
  //       body: Navigator(
  //         key: _navigatorKey,
  //         initialRoute: widget.setupPageRoute,
  //         onGenerateRoute: _onGenerateRoute,
  //       ),
  //     ),
  //   );
  // }

  // Route _onGenerateRoute(RouteSettings filterDrawer) {
  //   late Widget page;
  //   switch (filterDrawer.name) {
  //     case routeDeviceSetupStartPage:
  //       page = WaitingPage(
  //         message: 'Searching for nearby bulb...',
  //         onWaitComplete: _onDiscoveryComplete,
  //       );
  //       break;
  //     case routeDeviceSetupSelectDevicePage:
  //       page = SelectDevicePage(
  //         onDeviceSelected: _onDeviceSelected,
  //       );
  //       break;
  //     case routeDeviceSetupConnectingPage:
  //       page = WaitingPage(
  //         message: 'Connecting...',
  //         onWaitComplete: _onConnectionEstablished,
  //       );
  //       break;
  //     case routeDeviceSetupFinishedPage:
  //       page = FinishedPage(
  //         onFinishPressed: _exitSetup,
  //       );
  //       break;
  //   }

//     return MaterialPageRoute<dynamic>(
//       builder: (context) {
//         return page;
//       },
//       settings: filterDrawer,
//     );
//   }

//   PreferredSizeWidget _buildFlowAppBar() {
//     return AppBar(
//       leading: IconButton(
//         onPressed: _onExitPressed,
//         icon: const Icon(Icons.chevron_left),
//       ),
//       title: const Text('Bulb Setup'),
//     );
//   }
// }

//The SelectDevicePage widget is a screen that allows the user to select a nearby device. It includes a button to simulate device selection.
// class SelectDevicePage extends StatelessWidget {
//   const SelectDevicePage({
//     super.key,
//     required this.onDeviceSelected,
//   });

//   final void Function(String deviceId) onDeviceSelected;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Select a nearby device:',
//                 style: Theme.of(context).textTheme.titleLarge,
//               ),
//               const SizedBox(height: 24),
//               SizedBox(
//                 width: double.infinity,
//                 height: 54,
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateColor.resolveWith((states) {
//                       return const Color(0xFF222222);
//                     }),
//                   ),
//                   onPressed: () {
//                     onDeviceSelected('22n483nk5834');
//                   },
//                   child: const Text(
//                     'Bulb 22n483nk5834',
//                     style: TextStyle(
//                       fontSize: 24,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// The WaitingPage widget is a screen that displays a loading indicator and a message. It is used to simulate waiting for a process to complete.
// class WaitingPage extends StatefulWidget {
//   const WaitingPage({
//     super.key,
//     required this.message,
//     required this.onWaitComplete,
//   });

//   final String message;
//   final VoidCallback onWaitComplete;

//   @override
//   State<WaitingPage> createState() => _WaitingPageState();
// }

// class _WaitingPageState extends State<WaitingPage> {
//   @override
//   void initState() {
//     super.initState();
//     _startWaiting();
//   }

//   Future<void> _startWaiting() async {
//     await Future<dynamic>.delayed(const Duration(seconds: 3));

//     if (mounted) {
//       widget.onWaitComplete();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const CircularProgressIndicator(),
//               const SizedBox(height: 32),
//               Text(widget.message),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// //5. The FinishedPage widget is a screen that displays a success message and a button to finish the setup process.

// class FinishedPage extends StatelessWidget {
//   const FinishedPage({
//     super.key,
//     required this.onFinishPressed,
//   });

//   final VoidCallback onFinishPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 width: 250,
//                 height: 250,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color(0xFF222222),
//                 ),
//                 child: const Center(
//                   child: Icon(
//                     Icons.lightbulb,
//                     size: 175,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 32),
//               const Text(
//                 'Bulb added!',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 32),
//               ElevatedButton(
//                 style: ButtonStyle(
//                   padding: MaterialStateProperty.resolveWith((states) {
//                     return const EdgeInsets.symmetric(
//                         horizontal: 24, vertical: 12);
//                   }),
//                   backgroundColor: MaterialStateColor.resolveWith((states) {
//                     return const Color(0xFF222222);
//                   }),
//                   shape: MaterialStateProperty.resolveWith((states) {
//                     return const StadiumBorder();
//                   }),
//                 ),
//                 onPressed: onFinishPressed,
//                 child: const Text(
//                   'Finish',
//                   style: TextStyle(
//                     fontSize: 24,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//The HomeScreen widget is the main screen of the application. It displays a welcome message and a button to start the device setup process.

