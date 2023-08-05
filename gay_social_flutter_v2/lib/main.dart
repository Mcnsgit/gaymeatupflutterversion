import 'package:flutter/material.dart';
import 'widgets/nav_widget.dart' as nav;

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
        '/': (context) => const MyHomePage(title: 'Home'),
        '/filter_settings': (context) => const FilterSettingsScreen(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
              endDrawer: const Drawer(),
            ),
            body: const Center(
              child: Text('Page not found'),
            ),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        endDrawer: Drawer(
          child: IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              Navigator.pushNamed(context, '/filter_settings');
            },
          ),
        ),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
      bottomNavigationBar: const nav.Nav(),
    );
  }
}

class FilterSettingsScreen extends StatefulWidget {
  const FilterSettingsScreen({Key? key}) : super(key: key);
  @override
  State<FilterSettingsScreen> createState() => _FilterSettingsScreenState();
}

class _FilterSettingsScreenState extends State<FilterSettingsScreen> {
  late FilterSettingsData filterSettingsData;
  @override
  void initState() {
    super.initState();
    filterSettingsData = const FilterSettingsData(
      listUser: [],
      currentPosition: null,
      currentLookingFor: null,
      getLocation: null,
      currentAgeRange: RangeValues(20, 30),
    );
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    // Fetch users from data source and update filterSettingsData.listUser
    // Example: filterSettingsData.listUser = await UserService.fetchUsers();
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
        title: const Text('Filter Settings'),
        endDrawer: const Drawer(),
      ),
      body: Center(
        child: FilterSettings(
          onApplyFilters: _applyFilters,
          filterSettingsData: filterSettingsData,
        ),
      ),
    );
  }
}

class FilterSettings extends StatelessWidget {
  const FilterSettings({
    Key? key,
    required this.onApplyFilters,
    required this.filterSettingsData,
  }) : super(key: key);
  final Function(FilterSettingsData) onApplyFilters;
  final FilterSettingsData filterSettingsData;
  @override
  Widget build(BuildContext context) {
    // Build filter settings UI
    return Container();
  }
}

class FilterSettingsData {
  final List<String> listUser;
  final dynamic currentPosition;
  final dynamic currentLookingFor;
  final dynamic getLocation;
  final RangeValues currentAgeRange;
  const FilterSettingsData({
    required this.listUser,
    required this.currentPosition,
    required this.currentLookingFor,
    required this.getLocation,
    required this.currentAgeRange,
  });
}
