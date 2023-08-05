import 'package:flutter/material.dart';
import '../Services/location_service.dart';

class FilterDrawerWidget extends StatefulWidget {
  final ScrollController scrollController;
  final FilterSettingsData filterSettingsData;
  const FilterDrawerWidget({
    Key? key,
    required this.scrollController,
    required this.filterSettingsData,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _FilterDrawerWidgetState createState() => _FilterDrawerWidgetState();
}

class _FilterDrawerWidgetState extends State<FilterDrawerWidget> {
  late List<String> _filteredUsers = [];
  @override
  void initState() {
    super.initState();
    _filterUsers();
  }

  @override
  void didUpdateWidget(covariant FilterDrawerWidget oldWidget) {
    if (widget.filterSettingsData != oldWidget.filterSettingsData) {
      _filterUsers();
    }
    super.didUpdateWidget(oldWidget);
  }

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
    if (age != null) {
      return age >= widget.filterSettingsData.currentAgeRange.start &&
          age <= widget.filterSettingsData.currentAgeRange.end;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          
          controller: widget.scrollController,
          itemCount: _filteredUsers.length,
          itemBuilder: (context, index) {
            return _buildUserCard(_filteredUsers[index]);
          },
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Text(
              'Current Location: ${widget.filterSettingsData.currentLocation}'),
        ),
      ],
    );
  }
}

Widget _buildUserCard(String user) {
  return Card(
    child: Column(
      children: [
        const Expanded(
          child: Placeholder(),
        ),
        Text(
          user,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
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

  get getLocation => null;
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
  String? _currentPosition;
  String? _currentLookingFor;

  @override
  void initState() {
    super.initState();
    _currentPosition = widget.filterSettingsData.currentPosition;
    _currentLookingFor = widget.filterSettingsData.currentLookingFor;
  }

  List<DropdownMenuItem<String>> _getPositionDropdownItems() {
    return [
      const DropdownMenuItem<String>(
        value: '',
        child: Text('Any'),
      ),
      const DropdownMenuItem<String>(
        value: 'Top',
        child: Text('Top'),
      ),
      const DropdownMenuItem<String>(
        value: 'Top Vers',
        child: Text('Top Vers'),
      ),
      const DropdownMenuItem<String>(
        value: 'Vers',
        child: Text('Vers'),
      ),
      const DropdownMenuItem<String>(
        value: 'Side',
        child: Text('Side'),
      ),
      const DropdownMenuItem<String>(
        value: 'Bottom Vers',
        child: Text('Bottom Vers'),
      ),
      const DropdownMenuItem<String>(
        value: 'Bottom',
        child: Text('Bottom'),
      ),
    ];
  }

  List<DropdownMenuItem<String>> _getLookingForDropdownItems() {
    return [
      const DropdownMenuItem<String>(
        value: '',
        child: Text('Any'),
      ),
      const DropdownMenuItem<String>(
        value: 'Now Host',
        child: Text('Now Host'),
      ),
      const DropdownMenuItem<String>(
        value: 'Cruising',
        child: Text('Cruising'),
      ),
      const DropdownMenuItem<String>(
        value: 'Car',
        child: Text('Car'),
      ),
      const DropdownMenuItem<String>(
        value: 'Chat',
        child: Text('Chat'),
      ),
      const DropdownMenuItem<String>(
        value: 'Cam',
        child: Text('Cam'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 14),
          const Text(
            'Filter Settings',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Age Range:',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          RangeSlider(
            values: widget.filterSettingsData.currentAgeRange,
            min: 18,
            max: 75,
            divisions: 57,
            labels: RangeLabels(
              widget.filterSettingsData.currentAgeRange.start
                  .round()
                  .toString(),
              widget.filterSettingsData.currentAgeRange.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                widget.filterSettingsData.currentAgeRange = values;
              });
            },
            onChangeEnd: (RangeValues values) {
              widget.onApplyFilters(widget.filterSettingsData);
            },
          ),
          const SizedBox(height: 8),
          const Text(
            'Position:',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          DropdownButton<String>(
            value: _currentPosition,
            items: _getPositionDropdownItems(),
            onChanged: (String? value) {
              setState(() {
                _currentPosition = value;
                widget.filterSettingsData.currentPosition = value;
              });
            },
          ),
          const SizedBox(height: 10),
          const Text(
            'Looking For:',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 6),
          DropdownButton<String>(
            value: _currentLookingFor,
            items: _getLookingForDropdownItems(),
            onChanged: (String? value) {
              setState(() {
                _currentLookingFor = value;
                widget.filterSettingsData.currentLookingFor = value;
              });
            },
          ),
          const SizedBox(height: 10),
          const Text(
            'Location:',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              widget.onApplyFilters(widget.filterSettingsData);
            },
            child: const Text('Apply Filters'),
          ),
        ],
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
