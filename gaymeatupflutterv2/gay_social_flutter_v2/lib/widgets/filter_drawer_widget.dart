import 'package:flutter/material.dart';
import 'package:gay_social_flutter_v2/screens/location_screen.dart';
import '../Services/location_service.dart';

// ignore: must_be_immutable
class OnlineUserFilter extends StatefulWidget {
  final List<String>? listUser;
  final GlobalKey listViewKey;
  final ScrollController scrollController;
  String? currentPosition;
  String? currentLookingFor;
  RangeValues currentAgeRange;

  OnlineUserFilter({
    Key? key,
    required this.listUser,
    required this.listViewKey,
    required this.scrollController,
    required this.currentPosition,
    required this.currentLookingFor,
    required this.currentAgeRange, required currentLocation, required List userName, required RangeValues ageRange, required RangeValues AgeRange,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnlineUserFilterState createState() => _OnlineUserFilterState();
}

class _OnlineUserFilterState extends State<OnlineUserFilter> {
  late List<String> _filteredUsers = [];

  @override
  void initState() {
    super.initState();
    _filterUsers();
  }

  @override
  void didUpdateWidget(covariant OnlineUserFilter oldWidget) {
    if (widget.listUser != oldWidget.listUser ||
        widget.currentPosition != oldWidget.currentPosition ||
        widget.currentLookingFor != oldWidget.currentLookingFor ||
        widget.currentAgeRange != oldWidget.currentAgeRange) {
      _filterUsers();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _filterUsers() {
    _filteredUsers = widget.listUser!
        .where((user) =>
            (_isPositionMatching(user)) &&
            (_isLookingForMatching(user)) &&
            (_isAgeRangeMatching(user)))
        .toList();
  }

  bool _isPositionMatching(String user) {
    return widget.currentPosition == null ||
        widget.currentPosition!.isEmpty ||
        user.contains(widget.currentPosition!);
  }

  bool _isLookingForMatching(String user) {
    return widget.currentLookingFor == null ||
        widget.currentLookingFor!.isEmpty ||
        user.contains(widget.currentLookingFor!);
  }

  bool _isAgeRangeMatching(String user) {
    final age = int.tryParse(user.substring(1));
    if (age != null) {
      return age >= widget.currentAgeRange.start &&
          age <= widget.currentAgeRange.end;
    }
    return false;
  }

  // Create an instance of the location service
  final LocationService _locationService = LocationService();
  String _currentLocation = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          key: widget.listViewKey,
          controller: widget.scrollController,
          itemCount: _filteredUsers.length,
          itemBuilder: (context, index) {
            return _buildUserCard(_filteredUsers[index]);
          },
        ),
        FilterSettings(
          currentAgeRange: widget.currentAgeRange,
          currentPosition: widget.currentPosition,
          currentLookingFor: widget.currentLookingFor,
          currentLocation: _currentLocation,
          onApplyFilters: (ageRange, position, lookingFor, location) {
            setState(() {
              widget.currentAgeRange = ageRange;
              widget.currentPosition = position;
              widget.currentLookingFor = lookingFor;
              _filterUsers();
              _currentLocation = location!;
            });
          },
        ),
        ElevatedButton(
          onPressed: () async {
            String chosenLocation = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LocationScreen(
                  locationService: _locationService,
                  key: widget.listViewKey,
                  initialRoute: '',
                ),
              ),
            );
            setState(() {
              _currentLocation = chosenLocation;
            });
          },
          child: const Text('Set Location'),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Text('Current Location: $_currentLocation'),
        ),
        ElevatedButton(
          onPressed: () async {
            // When the user taps on the location button, open the location screen
            String chosenLocation = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LocationScreen(
                  locationService: _locationService,
                  key: widget.listViewKey,
                  initialRoute: '',
                ),
              ),
            );
            // Update the chosen location if the user selected a location
            setState(() {
              _currentLocation = chosenLocation;
            });
          },
          child: const Text('Set Location'),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Text('Current Location: $_currentLocation'),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Text('Current Location: $_currentLocation'),
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

// ignore: must_be_immutable
class FilterSettings extends StatefulWidget {
  final void Function(
    RangeValues ageRange,
    String? position,
    String? lookingFor,
    String? location,
  ) onApplyFilters;
  RangeValues currentAgeRange;
  final String? currentPosition;
  final String? currentLookingFor;
  final String? currentLocation;

  FilterSettings({
    Key? key,
    required this.onApplyFilters,
    required this.currentAgeRange,
    required this.currentPosition,
    required this.currentLookingFor,
    required this.currentLocation,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FilterSettingsState createState() => _FilterSettingsState();
}

class _FilterSettingsState extends State<FilterSettings> {
  String? _currentPosition;
  String? _currentLookingFor;

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
            values: widget.currentAgeRange,
            min: 18,
            max: 75,
            divisions: 57,
            labels: RangeLabels(
              widget.currentAgeRange.start.round().toString(),
              widget.currentAgeRange.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                widget.currentAgeRange = values;
              });
            },
            onChangeEnd: (RangeValues values) {
              widget.onApplyFilters(
                values,
                _currentPosition,
                _currentLookingFor,
                widget.currentLocation,
              );
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
              widget.onApplyFilters(
                widget.currentAgeRange,
                _currentPosition,
                _currentLookingFor,
                widget.currentLocation,
              );
            },
            child: const Text('Apply Filters'),
          ),
        ],
      ),
    );
  }
}
