import 'package:flutter/material.dart';
//
// Share icon
// This is a Flutter application that displays a list of filter options for online users.

// The main function initializes the OnlineUserFilterList widget and passes a list of FilterOption objects as a parameter.

// The OnlineUserFilterList widget is a stateless widget that builds the main app structure. It uses a MaterialApp as the root widget and sets the theme and home screen. The body of the home screen is a LayoutBuilder that wraps a SingleChildScrollView. Inside the SingleChildScrollView, a Column widget is used to display the FilterOptionItem widgets for each filter option in the list.

// The FilterOptionItem widget is a stateless widget that displays a Card with a Text widget inside. The Text widget displays the title of the filter option.

// The FilterSettingsData class is a data model that holds the selected filter settings. It has properties for a list of users, current position, current looking for option, location, and age range.

// The FilterSettings widget is a stateful widget that displays the filter options and allows the user to apply the selected filters. It receives a callback function onApplyFilters and the initial filter settings data as parameters. Inside the build method, it displays the FilterOptionItem widgets for each filter option and an ElevatedButton to apply the filters. When the button is pressed, it calls the onApplyFilters callback with the current filter settings data.

void main() {
  runApp(
    OnlineUserFilterList(
      filterOptionItems: [
        FilterOption('Looking for'),
        FilterOption('Position'),
        FilterOption('Age Range'),
        FilterOption('Online Now')
      ],
    ),
  );
}
class FilterOption {
  final String title;

  FilterOption(this.title);
}

class OnlineUserFilterList extends StatelessWidget {
  final List<FilterOption> filterOptionItems;

  const OnlineUserFilterList({Key? key, required this.filterOptionItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        cardTheme: CardTheme(color: Colors.blue.shade50),
      ),
      home: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: filterOptionItems
                    .map((item) => FilterOptionItem(filterOptionItem: item))
                    .toList(),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class FilterOptionItem extends StatelessWidget {
  final FilterOption filterOptionItem;

  const FilterOptionItem({Key? key, required this.filterOptionItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Center(child: Text(filterOptionItem.title)),
      ),
    );
  }
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

class FilterSettings extends StatefulWidget {
  final Function(FilterSettingsData) onApplyFilters;
  final FilterSettingsData filterSettingsData;

  const FilterSettings({
    Key? key,
    required this.onApplyFilters,
    required this.filterSettingsData,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FilterSettingsState createState() => _FilterSettingsState();
}

class _FilterSettingsState extends State<FilterSettings> {
  late FilterSettingsData _filterSettingsData;

  @override
  void initState() {
    super.initState();
    _filterSettingsData = widget.filterSettingsData;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FilterOptionItem(filterOptionItem: FilterOption('Looking for')),
          FilterOptionItem(filterOptionItem: FilterOption('Position')),
          FilterOptionItem(filterOptionItem: FilterOption('Age Range')),
          ElevatedButton(
            onPressed: () {
              widget.onApplyFilters(_filterSettingsData);
            },
            child: const Text('Apply Filters'),
            ),
        ],
      ),
    );
  }
}