import 'package:flutter/material.dart';
import '../services/user_service.dart';
class UserGridItem extends StatelessWidget {
  final User user;

  const UserGridItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network(
              user.profilePictureUrl), // Display the user's profile picture
          Text(user.name), // Display the user's name
          Text(user.location),// Display the user's locatio
          Text(user.lookingFor),
          Text(user.age.toString()),
          Text(user.isOnline.toString()),
          Text(user.position), 
        ],
      ),
    );
  }
}
