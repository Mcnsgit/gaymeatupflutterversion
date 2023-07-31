import 'package:flutter/material.dart';
import 'package:gay_social_flutter_v2/services/user_service.dart';
import '../methods/filter_methods.dart' as filter_methods;


class OnlineUserFilter extends StatefulWidget {
  final List<User> listUser;
  final GlobalKey listViewKey;
  final ScrollController scrollController;
  final String? currentPosition;
  final String? currentLookingFor;
  final RangeValues ageRange;
  final String? currentLocation;

const OnlineUserFilter({
    Key? key,
    required this.listUser,
    required this.listViewKey,
    required this.scrollController,
    this.currentPosition,
    this.currentLookingFor,
    required this.ageRange,
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
    setState(() {
      filteredUsers = filter_methods.applyFilters(
        users: widget.listUser,
        position: widget.currentPosition,
        lookingFor: widget.currentLookingFor,
        ageRange: widget.ageRange,
        location: widget.currentLocation,
      );
    });
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
            return _buildUserCard(filteredUsers[index].username);
          },
        ),
        // Implement the FilterSettings widget
        // ...
      ],
    );
  }

  Widget _buildUserCard(String userName) {
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
