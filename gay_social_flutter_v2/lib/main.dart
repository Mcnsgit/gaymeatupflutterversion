import 'package:flutter/material.dart';
import 'package:gay_social_flutter_v2/widgets/filter_drawer_widget.dart';
import 'widgets/nav_widget.dart' as nav;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pronto Pigs',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App Header Bar'),
          endDrawer: const Drawer(),
          ),
      floatingActionButton: const FloatingActionButton(onPressed: null),
      bottomNavigationBar: const nav.Nav(),
      body: const Column(
        children: [
          Text('A random idea:'),
          Text('appState.current'), // Placeholder
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(0),
              child: FilterDrawerWidget(
                scrollController: ScrollController(),
                filterSettingsData: FilterSettingsData(
                  listUser: [],
                  currentPosition: '',
                  currentLookingFor: '',
                  currentAgeRange: const RangeValues(20, 30),
                ),
                onApplyFilters: (FilterSettingsData newFilter) {},
              ),
            ),
          ],
        ),
      ),
      // body: ...
    );
  }
}
