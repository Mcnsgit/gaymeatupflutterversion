import 'package:flutter/material.dart';
import '../backend/models/user_model.dart';

// ignore: must_be_immutable
class OnlineUserFilter extends StatefulWidget {
  GlobalKey listViewKey;
  final ScrollController scrollController;
  String? currentPosition;
  String? currentLookingFor;
  late RangeValues ageRange;
  String? currentLocation;
  List<User>? userName;
  OnlineUserFilter(
    dynamic listUser, {
    Key? key,
    required this.listViewKey,
    required this.userName,
    required this.scrollController,
    this.currentPosition,
    this.currentLookingFor,
    dynamic ageRange,
    this.currentLocation,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _OnlineUserFilterState createState() => _OnlineUserFilterState();
}

class _OnlineUserFilterState extends State<OnlineUserFilter> {
  List<User> filteredUsers = [];
  @override
  void initState() {
    super.initState();
    applyFilters();
  }

void applyFilters() {
    filteredUsers = ListView as List<User>;
widget.userName != null
        ? widget.userName!
        
        .cast<User>():filteredUsers; 
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          key: widget.listViewKey,
          controller: widget.scrollController,
          itemCount: filteredUsers.length,
          itemBuilder: (context, index) {
            return _buildUserCard(
              filteredUsers[index].username,
              filteredUsers[index].age,
              filteredUsers[index].position,
              filteredUsers[index].lookingFor,
            );
          },
        ),
        // Implement the FilterSettings widget
        // ...
      ],
    );
  }

  Widget _buildUserCard(String userName, int userAge, String userPosition,
      String userLookingFor) {
    return Card(
      child: Column(
        children: [
          const Expanded(
            child: Placeholder(),
          ),
          Text(
            userName,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
