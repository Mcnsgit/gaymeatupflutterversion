import 'package:flutter/material.dart';
import 'package:gay_social_flutter_v2/services/location_service.dart';
import '../Services/location_service.dart';

// ignore: must_be_immutable
class OnlineUserFilter extends StatefulWidget {
  final GlobalKey listViewKey;
  final ScrollController scrollController;
  FilterSettingsData filterSettingsData;

  OnlineUserFilter({
    Key? key,
    required this.listViewKey,
    required this.scrollController,
    required this.filterSettingsData,
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
    if (widget.filterSettingsData != oldWidget.filterSettingsData) {
      _filterUsers();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _filterUsers() {
    _filteredUsers = widget.filterSettingsData.listUser!
        .where((user) =>
            (_isPositionMatching(user)) &&
            (_isLookingForMatching(user)) &&
            (_isAgeRangeMatching(user)))
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
          key: widget.listViewKey,
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

  FilterSettingsData(
      {this.listUser,
      this.currentPosition,
      this.currentLookingFor,
      this.currentLocation,
      required this.currentAgeRange});
}

class FilterSettings extends StatefulWidget {
  final Function(FilterSettingsData) onApplyFilters;
  final FilterSettingsData filterSettingsData;
  final LocationService locationService;

  const FilterSettings({
    Key? key,
    required this.onApplyFilters,
    required this.filterSettingsData,
    required this.locationService, required LocationService LocationService,
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
          // Remaining widgets ...
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
