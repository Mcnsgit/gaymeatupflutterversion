import 'package:flutter/material.dart';
import '../widgets/nav_widget.dart' as nav;
import '../widgets/filter_drawer_widget.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  FilterSettingsData filterSettingsData = FilterSettingsData(
    currentAgeRange: const RangeValues(20, 30),
  );

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void applyFilters(FilterSettingsData newFilter) {
    setState(() {
      filterSettingsData = newFilter;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        endDrawer: Drawer(
            child: FilterDrawerWidget(
          scrollController: _scrollController,
          filterSettingsData: filterSettingsData,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return FilterSettings(
                    locationService: filterSettingsData.getLocation,
                    filterSettingsData: filterSettingsData,
                    onApplyFilters: applyFilters,
                  );
                },
              );
            },
            child: const Text('Open Filters'),
          ),
        ),
        bottomNavigationBar: const nav.Nav(),
      );
    }
  // Dispose the ScrollController
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
