import 'package:flutter/material.dart';
import '../Services/location_service.dart';

// /**
//  * A widget that displays a list of filtered users based on the filter settings provided.
//  *
//  * The `FilterDrawerWidget` class is a stateful widget that displays a list of filtered users based on the filter settings provided.
//  * It takes a `scrollController`, `filterSettingsData`, and `onApplyFilters` function as parameters.
//  * The filtered users are displayed in a `ListView.builder` widget. After settings are changed to users' preferences and the 'Apply Filters' button is pressed, the `ListView.builder` on the home screen is updated, causing the grid list of online users to reload with the updated preferences.
//  */
class FilterDrawerWidget extends StatefulWidget {
  final ScrollController scrollController;
  final FilterSettingsData filterSettingsData;
  final void Function(FilterSettingsData newFilter) onApplyFilters;

  const FilterDrawerWidget({
    Key? key,
    required this.scrollController,
    required this.filterSettingsData,
    required this.onApplyFilters,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FilterDrawerWidgetState createState() => _FilterDrawerWidgetState();
}

//  * The state of the `FilterDrawerWidget`.
class _FilterDrawerWidgetState extends State<FilterDrawerWidget> {
  List<String> _filteredUsers = [];

  @override
  void initState() {
    super.initState();
    _filterUsers();
  }

  // /**
  //  * Filters the list of users based on the current filter settings.
  //  */

  void _filterUsers() {
    _filteredUsers = widget.filterSettingsData.listUser!
        .where((user) =>
            _isPositionMatching(user) &&
            _isLookingForMatching(user) &&
            _isAgeRangeMatching(user))
        .toList();
  }

  bool _isPositionMatching(String user) {
    return widget.filterSettingsData.currentPosition == null ||
        widget.filterSettingsData.currentPosition!.isEmpty ||
        user.contains(widget.filterSettingsData.currentPosition!);
  }

  bool _isLookingForMatching(String user) {
    return widget.filterSettingsData.currentLookingFor == null ||
        widget.filterSettingsData.currentLookingFor!.isEmpty ||
        user.contains(widget.filterSettingsData.currentLookingFor!);
  }

  bool _isAgeRangeMatching(String user) {
    final age = int.tryParse(user.substring(1));
    return age != null &&
        age >= widget.filterSettingsData.currentAgeRange.start &&
        age <= widget.filterSettingsData.currentAgeRange.end;
  }

  // /**
  //  * Builds a `Card` widget with the user's information.
  //  *
  //  * @param user The user's name.
  //  * @return The `Card` widget.
  //  */
  Widget _buildUserCard(String user) {
    return Card(
      child: ListTile(title: Text(user, style: const TextStyle(fontSize: 16))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.scrollController,
      itemCount: _filteredUsers.length,
      itemBuilder: (context, index) {
        return _buildUserCard(_filteredUsers[index]);
      },
    );
  }
}

class FilterSettingsData {
  List<String>? listUser;
  String? currentPosition;
  String? currentLookingFor;
  String? currentLocation;
  RangeValues currentAgeRange;

  FilterSettingsData({
    this.listUser,
    this.currentPosition,
    this.currentLookingFor,
    this.currentLocation,
    required this.currentAgeRange,
  });
}

class FilterSettings extends StatefulWidget {
  final Function(FilterSettingsData) onApplyFilters;
  final FilterSettingsData filterSettingsData;
  final LocationService locationService;

  const FilterSettings({
    Key? key,
    required this.onApplyFilters,
    required this.filterSettingsData,
    required this.locationService,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FilterSettingsState createState() => _FilterSettingsState();
}

class _FilterSettingsState extends State<FilterSettings> {
  String? currentPosition;
  String? currentLookingFor;
  String? currentLocation;
  _getLookingForDropdownItems() => _getLookingForDropdownItems();
  _getPositionDropdownItems() => _getPositionDropdownItems();

  @override
  void initState() {
    super.initState();
    currentPosition = widget.filterSettingsData.currentPosition;
    currentLookingFor = widget.filterSettingsData.currentLookingFor;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Position:', style: TextStyle(fontSize: 14)),
        const SizedBox(height: 10),
        DropdownButton<String>(
          value: currentPosition,
          items: _getPositionDropdownItems(),
          onChanged: (newValue) {
            setState(() {
              currentPosition = newValue;
            });
          },
        ),
        DropdownButton<String>(
          value: currentLookingFor,
          items: _getLookingForDropdownItems(),
          onChanged: (newValue) {
            setState(() {
              currentLookingFor = newValue;
            });
          },
        ),
        ElevatedButton(
          onPressed: () => widget.locationService.getCurrentLocation(),
          child: const Text('Fetch Current Position'),
        ),
        const SizedBox(height: 10),
        const Text('Looking For:', style: TextStyle(fontSize: 14)),
        const SizedBox(height: 10),

        // Assuming you have a similar function for `getCurrentLookingFor`
        // ElevatedButton(
        //   onPressed: getCurrentLookingFor,
        //   child: const Text('Fetch Current Looking For'),
        // ),
        RangeSlider(
          values: widget.filterSettingsData.currentAgeRange,
          min: 18,
          max: 100,
          divisions: 100,
          labels: RangeLabels(
            '${widget.filterSettingsData.currentAgeRange.start}',
            '${widget.filterSettingsData.currentAgeRange.end}',
          ),
          onChanged: (RangeValues values) {
            setState(() {
              widget.filterSettingsData.currentAgeRange = values;
            });
          },
        ),
        const SizedBox(height: 10),
        const Text('Location:', style: TextStyle(fontSize: 14)),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _applyFilters,
          child: const Text('Apply Filters'),
        ),
      ],
    );
  }

  // Assuming currentPosition and currentLookingFor are Widgets, place them here
  // currentPosition,
  // currentLookingFor,

  // [Add your other UI components here]
  void _applyFilters() {
    widget.onApplyFilters(
      FilterSettingsData(
        listUser: widget
            .filterSettingsData.listUser, // or your modified list of users
        currentPosition: currentPosition,
        currentLookingFor: currentLookingFor,
        currentLocation: widget
            .filterSettingsData.currentLocation, // or your updated location
        currentAgeRange: widget.filterSettingsData.currentAgeRange,
      ),
    );
  }
}
// class _FilterSettingsState extends State<FilterSettings> {
// //   String? _currentPosition;
// //   String? _currentLookingFor;
//   List<DropdownMenuItem<String>> _getPositionDropdownItems() {
//     // Implement the logic to generate dropdown items for positions
//     return [
//       const DropdownMenuItem<String>(
//         value: '',
//         child: Text('Any'),
//       ),
//       const DropdownMenuItem<String>(
//         value: 'Top',
//         child: Text('Top'),
//       ),
//       const DropdownMenuItem<String>(
//         value: 'Top Vers',
//         child: Text('Top Vers'),
//       ),
//       const DropdownMenuItem<String>(
//         value: 'Vers',
//         child: Text('Vers'),
//       ),
//       const DropdownMenuItem<String>(
//         value: 'Side',
//         child: Text('Side'),
//       ),
//       const DropdownMenuItem<String>(
//         value: 'Bottom Vers',
//         child: Text('Bottom Vers'),
//       ),
//       const DropdownMenuItem<String>(
//         value: 'Bottom',
//         child: Text('Bottom'),
//       ),
//     ];
//   }

//   List<DropdownMenuItem<String>> _getLookingForDropdownItems() {
//     return [
//       const DropdownMenuItem<String>(
//         value: '',
//         child: Text('Any'),
//       ),
//       const DropdownMenuItem<String>(
//         value: 'Now Host',
//         child: Text('Now Host'),
//       ),
//       const DropdownMenuItem<String>(
//         value: 'Cruising',
//         child: Text('Cruising'),
//       ),
//       const DropdownMenuItem<String>(
//         value: 'Car',
//         child: Text('Car'),
//       ),
//       const DropdownMenuItem<String>(
//         value: 'Chat',
//         child: Text('Chat'),
//       ),
//       const DropdownMenuItem<String>(
//         value: 'Cam',
//         child: Text('Cam'),
//       ),
//     ];
//   }
// }
